import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/data/models/audio_model/AudioModel.dart';
import 'package:islami_app/data/models/tafseer_model/TafseerModel.dart';
import 'package:islami_app/utiles/remote/azkar_dio_helper.dart';
import 'package:islami_app/utiles/remote/dio_helper.dart';
import 'package:islami_app/utiles/remote/tafseer_dio_helper.dart';
import 'package:meta/meta.dart';
import 'package:islami_app/data/models/surah_details_model/surah_details_model.dart';
import '../../data/models/azkar/azkar_model/azkar_model.dart';
import '../../data/models/surah_model/surahModel.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

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
  List<AyahsModel>? ayahContent = [];

  Future<void> getAyah(int index) async {
    ayahContent = [];
    emit(GetAyahLoadingState());
    DioHelper.getData(
      url: '/surah/$index',
    ).then((value) {
      print("-----------------------------$value");
      surahDetailsModel = SurahDetailsModel.fromJson(value.data);
      surahDetailsModel!.data!.ayahsModel!.forEach((element) {
        ayahContent!.add(element);
      });
      print("************${ayahContent![index]}");
      emit(GetAyahSuccessState());
    }).catchError((error) {
      print('Error in Get Ayah From Api is :${error.toString()}');
      emit(GetAyahErrorState());
    });
  }

  Azkar? azkarModel;
  List<Azkar> azkarContent = [];

  Future<dynamic> getZekr({required String? zekr}) async {
    azkarContent = [];
    emit(GetZekrLoadingState());
    await AzkarDioHelper.getData(
      url: '/zekr?$zekr',
    ).then((value) {
      try {
        emit(GetZekrSuccessState());
        print("azkar-----------------------------${value.data}");
        azkarModel = Azkar.fromJson(jsonDecode(value.data!));
        azkarContent = value.data!;

        // value.data.forEach((element) {
        //   azkarContent.add(Azkar.fromJson(element));
        // });
        emit(GetZekrSuccessState());
      } catch (e) {
        emit(GetZekrErrorState());
        print("*****${e.toString()}");
      }
    });
  }

  // bool play = false;
  // final player = AudioPlayer();
  //
  // bool changePlay(String url) {
  //   if (play == false) {
  //     player.play(UrlSource(url));
  //     emit(PlayAudioState());
  //     return play = true;
  //   } else {
  //     player.stop();
  //     emit(StopAudioState());
  //     return play = false;
  //   }
  // }

  AudioModel? audioModel;
  List<Surahs> audioContent = [];

  Future<dynamic> getAudio() async {
    audioContent = [];
    emit(GetAudioLoadingState());
    await DioHelper.getData(
      url: '/quran/ar.alafasy',
    ).then((value) {
      try {
        print("-----------------------------${value.data}");
        audioModel = AudioModel.fromJson(jsonDecode(value.data!));
        audioContent = value.data!;
        value.data!.forEach((element) {
          audioContent.add(element);
        });
        emit(GetAudioSuccessState());
      } catch (e) {
        emit(GetAudioErrorState());
        print("*****${e.toString()}");
      }
      ;
    });
  }

  TafseerModel? tafseerModel;
  List<TafseerModel> tafseerContent = [];

  Future<dynamic> getTafseer(
      {required int? tafseerId,
      required int? suraNumber,
      required int? ayahNumber}) async {
    tafseerContent = [];
    emit(GetTafseerLoadingState());

    await TafseerDioHelper.getData(
      url: '/$tafseerId/$suraNumber/$ayahNumber',
    ).then((value) {
      try {
        emit(GetTafseerSuccessState());
        print("value.data-----------------------------${value.data}");
        tafseerModel = TafseerModel.fromJson(value.data!);
        tafseerContent = value.data!;
        // (value.data)!.forEach((element) {
        //   tafseerContent!.toList().add(TafseerModel.fromJson(element));
        //   emit(GetTafseerSuccessState());
        //   print("-----------------------------${tafseerContent![0].text}");
        // });
      } catch (e) {
        emit(GetTafseerErrorState());
        print("*****${e.toString()}");
      }
    }).catchError((onError) {
      emit(GetTafseerErrorState());
      print("***${onError.toString()}");
    });

    // emit(GetTafseerLoadingState());
    // await TafseerDioHelper.getData(
    //   url: '/$tafseerId/$suraNumber/$ayahNumber',
    // ).then((value) {
    //   try {
    //     emit(GetTafseerSuccessState());
    //     print("-----------------------------${value.data}");
    //     tafseerModel = TafseerModel.fromJson(value);
    //     value.data.forEach((element) {
    //       tafseerContent!.add(TafseerModel.fromJson(element.data()));
    //       emit(GetTafseerSuccessState());
    //       print("-----------------------------${tafseerContent![0].text}");
    //     });
    //   } catch (e) {
    //     emit(GetTafseerErrorState());
    //     print("*****${e.toString()}");
    //   }
    // }).catchError((onError) {
    //   emit(GetTafseerErrorState());
    //   print("***${onError.toString()}");
    // });
  }


  int currentIndex = 0;
  int counter = 0;
  List<String> tasbehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

    sebhaCounter() {
      counter++;
      emit(ChangeCounterState());
      if (counter == 31) {
      currentIndex++;
      emit(ChangeCounterState());
      counter = 0;
      emit(ChangeCounterState());

    }
    if (currentIndex > tasbehList.length - 1) {
      currentIndex = 0;
      emit(ChangeCounterState());
    }
  }

// AudioModel? audioModel;
// List<AudioFiles>? audioFiles = [];
// Future<void> getAudio() async {
//   audioFiles = [];
//   if (audioModel != null) {
//     emit(GetAudioSuccessState());
//   } else {
//     await AudioDioHelper.getData(
//       url: '/v4/chapter_recitations/1',
//     ).then((value) {
//       audioModel = AudioModel.fromJson(value.data);
//       if (audioModel!.audioFiles != null) {
//         audioModel!.audioFiles!.forEach((element) {
//           audioFiles!.add(element);
//         });
//         emit(GetAudioSuccessState());
//       } else {
//         emit(GetAudioErrorState());
//       }
//     });
//   }
// }
}
