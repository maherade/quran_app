import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
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
import 'package:islami_app/utiles/local/cash_helper.dart';
import 'package:islami_app/utiles/remote/ahadeth_dio_helper.dart';
import 'package:islami_app/utiles/remote/audio_dio_helper.dart';
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




  AudioModel? audioModel;

  Future<void> getAudio() async {
    // audioContent = [];
    emit(GetAudioLoadingState());
     AudioDioHelper.getData(
      url: 'chapter_recitations/1?language=en',
    ).then((value) {
      print(value.statusCode);

      audioModel=AudioModel.fromJson(value.data);
      print(audioModel!.audioFiles![0].audioUrl);

      print('I am Here');
      // print(value.data);

      emit(GetAudioSuccessState());
    }).catchError((error){
      print('Error is ${error.toString()}');
      emit(GetAudioErrorState());
    });
  }

  final player = AudioPlayer();

  bool isPlaying=false;
  String test='';
  Future<void> audioPlayerFunction({required String url})async{

    await player.play(UrlSource(url)).then((value) {
      test='1';
      emit(GetAudioSuccessState());

    }).catchError((error){

      print('Error is ${error.toString()}');
      emit(GetAudioErrorState());
    });

  }

  Future<bool> pausePlayer(context) async {
    player.stop();
    Navigator.pop(context,MaterialPageRoute(builder: (_){
      return const QuranScreen();
    }));
    test='';
    emit(GetAudioSuccessState());

    return isPlaying;
  }

  void getPlayer(){

    emit(GetAudioSuccessState());

  }

  double percentage=0.0;
  int sets=0;
  sebhaCounter() {
    counter++;
    percentage+=.030303030303;
    print(counter);
    emit(ChangeCounterState());
    if (counter == 33 || percentage==999.999) {
      currentIndex++;
      sets++;
      emit(ChangeCounterState());
      counter = 0;
      percentage=0.0;
      emit(ChangeCounterState());
    }
    if (currentIndex > tasbehList.length - 1) {
      currentIndex = 0;
      emit(ChangeCounterState());
    }
  }
  resetCounter() {
    counter = 0;
    sets=0;
    percentage=0.0;
    emit(ChangeCounterState());
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
  }

  int currentIndex = 0;
  int counter = 0;
  List<String> tasbehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  List<String> countryList = [
    "مصر , القاهره",
    "لبنان , بيروت",
    "السعوديه , الرياض",
    "فلسطين , غزه",
    "العراق , بغداد",
    "ليبيا , طرابلس",
    "السودان , الخرطوم",
    "قطر , الدوحة",
    "عُمان , مسقط",
  ];

  // sebhaCounter() {
  //   counter++;
  //   print(counter);
  //   emit(ChangeCounterState());
  //   if (counter == 31) {
  //     currentIndex++;
  //     emit(ChangeCounterState());
  //     counter = 0;
  //     emit(ChangeCounterState());
  //   }
  //   if (currentIndex > tasbehList.length - 1) {
  //     currentIndex = 0;
  //     emit(ChangeCounterState());
  //   }
  // }
  // resetCounter() {
  //   counter = 0;
  //   emit(ChangeCounterState());
  // }

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
    String city ='gaza',
    String  country='palestine',
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

  int indexValue=3;
  void changeCountry(BuildContext context,int index){
    if(index==0){
     indexValue=0;
      getPrayTimes(
        country: 'egypt',
        city: 'cairo ',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'egypt');
        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });
    }
    else if(index==1){
      indexValue=1;
      getPrayTimes(
        country: 'Lebanon',
        city: 'Beirut',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Lebanon');

        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });

    }
    else if(index==2){
      indexValue=2;
      getPrayTimes(
        country: 'Saudi Arabia',
        city: 'Riyadh',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Saudi Arabia');

        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });

    }
    else if(index==3){
      indexValue=3;
     getPrayTimes(
        country: 'palestine',
        city: 'gaza',
      ).then((value){
       CashHelper.saveData(key: 'country', value:'palestine');

       Navigator.pop(context);
       emit(ChangeCountrySuccessState());
     });

    }
    else if(index==4){
      indexValue=4;
      getPrayTimes(
        country: 'Iraq',
        city: 'Baghdad',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Iraq');
        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });

    }
    else if(index==5){
      indexValue=5;
      getPrayTimes(
        country: 'Libya',
        city: 'Tripoli',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Libya');
        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });

    }
    else if(index==6){
      indexValue=6;
      getPrayTimes(
        country: 'Sudan',
        city: 'Khartoum',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Sudan');
        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });

    }
    else if(index==7){
     indexValue=7;
     getPrayTimes(
        country: 'Qatar',
        city: 'Doha',
      ).then((value){
       CashHelper.saveData(key: 'country', value:'Qatar');
       Navigator.pop(context);
       emit(ChangeCountrySuccessState());
     });
    }
    else{
      indexValue=8;
      print(indexValue);
      getPrayTimes(
        country: 'Oman',
        city: 'Muscat',
      ).then((value){
        CashHelper.saveData(key: 'country', value:'Oman');
        Navigator.pop(context);
        emit(ChangeCountrySuccessState());
      });
    }
  }

}
