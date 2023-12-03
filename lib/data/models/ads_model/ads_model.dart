import 'package:admob_flutter/admob_flutter.dart';


class AdsModel {
  static const bool _testMood = false;
  static String getBannerAd() {
    if (_testMood) {
      return AdmobBanner.testAdUnitId;
    }
       return "ca-app-pub-7055907013118824/2238589480";

  }

  static String getInitAd() {
    if (_testMood) {
      return AdmobInterstitial.testAdUnitId;
    }
      return "ca-app-pub-7055907013118824/8118474268";

  }

  static String betweenAds() {
    if (_testMood) {
      return AdmobReward.testAdUnitId;
    }
      return "ca-app-pub-7055907013118824/7107772788";
  }

//   ca-app-pub-7055907013118824/8118474268

  // static String openAppAds() {
  //   // if (_testMood) {
  //   //   return AdmobReward.testAdUnitId;
  //   // }
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7055907013118824/8118474268";
  //   } else if (Platform.isIOS) {
  //     return "-----------------------------------";
  //   } else {
  //     return "UnSupported platForm";
  //   }
  // }

}
