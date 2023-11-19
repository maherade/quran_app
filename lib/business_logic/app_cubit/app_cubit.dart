import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/data/models/audio/AudioModel.dart';
import 'package:islami_app/data/models/azkar/azkar_alsabah/azkar_alsabah.dart';
import 'package:islami_app/presentation/screens/audio_screen/audio_screen.dart';
import 'package:islami_app/presentation/screens/tafseer_screen/tafseer_screen.dart';
import 'package:islami_app/utiles/remote/azkar_dio_helper.dart';
import 'package:islami_app/utiles/remote/dio_helper.dart';
import 'package:meta/meta.dart';
import 'package:islami_app/data/models/surah_details_model/surah_details_model.dart';
import '../../data/models/surah_model/surahModel.dart';
import '../../utiles/remote/audio_dio_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> tabs = [
    // ReadingScreen(index: ,),
    const AudioScreen(),
    const TafseerScreen(),
  ];

  SurahModel? surahModel;
  List<Data>? surahNames = [];

  Future<void> getSurah() async {
    emit(GetSurahLoadingState());
    if (surahModel != null) {
      emit(GetSurahSuccessState());
    } else {
      await DioHelper.getData(url: '/surah').then((value) {
        surahModel = SurahModel.fromJson(value.data);
        if (surahModel!.data != null) {
          surahModel!.data!.forEach((element) {
            surahNames!.add(element);
          });
          emit(GetSurahSuccessState());
        } else {
          emit(GetSurahErrorState());
        }
      });
    }
  }

  SurahDetailsModel? surahDetailsModel;
  List<Ayahs>? ayahContent = [];
  Future<void> getAyah(int index) async {
    ayahContent = [];
    emit(GetAyahLoadingState());
    DioHelper.getData(
      url: '/surah/$index',
    ).then((value) {
      print("-----------------------------$value");
      surahDetailsModel = SurahDetailsModel.fromJson(value.data);
      surahDetailsModel!.data!.ayahs!.forEach((element) {
        ayahContent!.add(element);
      });
      print("************${ayahContent![index]}");
      emit(GetAyahSuccessState());
    }).catchError((error) {
      print('Error in Get Ayah From Api is :${error.toString()}');
      emit(GetAyahErrorState());
    });
  }

  Azkar? azkarAlsabah;
  Future<void> getZekr(String dekr) async {
    emit(GetZekrLoadingState());
    AzkarDioHelper.getData(
      url: '/dekr?types=$dekr',
    ).then((value) {
      azkarAlsabah = Azkar.fromJson(value.data);
      emit(GetZekrSuccessState());
      print("-----------------------------$value");
    }).catchError((error) {
      print('Error in Get Zekr From Api is :${error.toString()}');
      emit(GetZekrErrorState());
    });
  }

  bool play = false;
  final player = AudioPlayer();

  bool changePlay(String url) {
    if(play==false){
      player.play(UrlSource(url));
      emit(ChangePlayState());
      return play=true;
    }else{
      player.stop();
      emit(ChangePlayState());
      return play=false;
    }
  }

  AudioModel? audioModel;
  List<AudioFiles>? audioFiles = [];
  Future<void> getAudio(int chapterId) async {
    audioFiles = [];
    if (audioModel != null) {
      emit(GetAudioSuccessState());
    } else {
      await AudioDioHelper.getData(
        url: '/v4/chapter_recitations/1',
      ).then((value) {
        audioModel = AudioModel.fromJson(value.data);
        if (audioModel!.audioFiles != null) {
          audioModel!.audioFiles!.forEach((element) {
            audioFiles!.add(element);
          });
          emit(GetAudioSuccessState());
        } else {
          emit(GetAudioErrorState());
        }
      });
    }
  }
}
