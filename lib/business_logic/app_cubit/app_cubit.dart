import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/data/models/ahadeth_model/ahadeth_model.dart';
import 'package:islami_app/data/models/audio_model/AudioModel.dart';
import 'package:islami_app/data/models/pray_model/pray_model.dart';
import 'package:islami_app/data/models/tafseer_model/TafseerModel.dart';
import 'package:islami_app/presentation/screens/ahadeth_screen/ahadeth_screen.dart';
import 'package:islami_app/presentation/screens/allah_names/allah_names.dart';
import 'package:islami_app/presentation/screens/astakhar_pray/astakhar_pray.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_alsabah/azkar_alsabah.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_night/azkar_night.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_pray/azkar_pray.dart';
import 'package:islami_app/presentation/screens/azkar_screens/tasabih/tasabih.dart';
import 'package:islami_app/presentation/screens/prayer_times/prayer_times.dart';
import 'package:islami_app/presentation/screens/qebla_screen/qebla_screen.dart';
import 'package:islami_app/presentation/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/presentation/screens/rasol_life_screen/rasol_life_screen.dart';
import 'package:islami_app/presentation/screens/tasbeeh_screen/tasbeeh_screen.dart';
import 'package:islami_app/utiles/remote/ahadeth_dio_helper.dart';
import 'package:islami_app/utiles/remote/azkar_dio_helper.dart';
import 'package:islami_app/utiles/remote/dio_helper.dart';
import 'package:islami_app/utiles/remote/pray_dio_helper.dart';
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
    print(counter);
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
  resetCounter() {
    counter = 0;
    emit(ChangeCounterState());
  }

  AhadethModel? ahadethModel;
  List<Items> ahadethItems = [];

  Future<dynamic> getAhadeth() async {
    ahadethItems = [];
    emit(GetAhadethLoadingState());
    await AhadethDioHelper.getData(
        url: '/hadith/abu-dawud',
        query: {
          'page': '1',
          'limit': '100',
        }).then((value) {
          print("///////////");
          value.data['items'].forEach((element) {
            ahadethItems.add(Items.fromJson(element));
          });
          print("++++${ahadethItems[0].arab}");
          emit(GetAhadethSuccessState());

    }).catchError((onError){
      emit(GetAhadethErrorState());
      print("***${onError.toString()}");
    });
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





  /// Pray Times

  PrayModel? prayModel;

  Future<void> getPrayTimes({
    String city ='cairo',
    String  country='egypt',
  })
  async{
    emit(GetPrayTimesLoadingState());
    await PrayDioHelper.getData(
        url: 'v1/timingsByCity',
        query: {
          'city':city,
          'country':country,
          'method':'8',
        }
    ).then((value) {

      print('Here');
      print(value.data['code']);
      prayModel=PrayModel.fromJson(value.data);

      emit(GetPrayTimesLSuccessState());
    }).catchError((error){

      debugPrint('Error in get pray times is ${error.toString()}');
      emit(GetPrayTimesLErrorState());
    });

  }


  /// Azkar

  List<Azkar> azkarMorning=[];
  List<Azkar> azkarNight=[];
  List<Azkar>  azkarDooa=[];
  List<Azkar>  azkarTasabih=[];

  Future<void> getZekr() async {
    emit(GetZekrLoadingState());
    AzkarDioHelper.getData(
      url: 'azkar.json',
    ).then((value) {

      jsonDecode(value.data)['أذكار الصباح'][0].forEach((element){
        print(element);
        azkarMorning.add(Azkar.fromJson(element));
      });


      jsonDecode(value.data)['أذكار المساء'].forEach((element){
        print(element);
        azkarNight.add(Azkar.fromJson(element));
      });

      print(azkarNight[0].category);

      jsonDecode(value.data)['أذكار بعد السلام من الصلاة المفروضة'].forEach((element){
        print(element);
        azkarDooa.add(Azkar.fromJson(element));
      });

      jsonDecode(value.data)['تسابيح'].forEach((element){
        print(element);
        azkarTasabih.add(Azkar.fromJson(element));
      });

      emit(GetZekrSuccessState());
    }).catchError((error) {
      print('Error in Get Zekr From Api is :${error.toString()}');
      emit(GetZekrErrorState());
    });
  }

  List<String> sectionImages=[
    "assets/images/quran.png",
    "assets/images/sun.png",
    "assets/images/moon.png",
    "assets/images/praying.png",
    "assets/images/time.png",
    "assets/images/hadeth.jpg",
    "assets/images/sebha.jpg",
    "assets/images/tasbih.png",
    "assets/images/qibla.png",
    "assets/images/stakhara.png",
    "assets/images/allah.png",
    "assets/images/paper.png",
  ];

  List<String> sectionTitles=[
    "القرآن الكريم",
    "أذكار الصباح",
    "أذكار المساء",
    "أذكار بعد الصلاه",
    "مواقيت الصلاه",
    "أحاديث",
    "تسابيح",
    "السبحه",
    "القبله",
    "صلاه الاستخاره",
    "اسماء الله الحسنه",
    "سيره الرسول",
  ];

  List<Widget> sectionWidget=[
    QuranScreen(),
    AzkarAlsabah(),
    AzkarNight(),
    AzkarPray(),
    PrayerTimes(),
    AhadethScreen(),
    Tasabih(),
    TasbeehScreen(),
    QeblaScreen(),
    AstakharPray(),
    AllahNames(),
    RasolLifeScreen(),
  ];


  List<Color> sectionColors=[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.lightGreen
  ];

}
