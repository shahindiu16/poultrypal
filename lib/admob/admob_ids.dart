import 'package:flutter/foundation.dart' show kDebugMode;

class AdMobAdIds {
  // static String? get testDeviceID {
  //   if (Platform.isAndroid) {
  //     return "YOUR_ANDROID_TEST_DEVICE_ID";
  //   } else if (Platform.isIOS) {
  //     return "YOUR_IOS_TEST_DEVICE_ID";
  //   }
  //   return null;
  // }

  // static String get testBannerAdUnitId {
  //   return "ca-app-pub-3940256099942544/9214589741";
  // }
  //
  // static String get testInterstitialAdUnitId {
  //   return 'ca-app-pub-3940256099942544/1033173712';
  // }

  // Add more ad unit types here if needed
  static String get homeScreenbannerAdUnitId {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/8510169505"; // Test ID
  }

  static String get diseasesBannerAdUnitId1 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/5884006166"; // Test ID
  }

  static String get diseasesBannerAdUnitId2 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/7515817882"; // Test ID
  }

  static String get diseasesBannerAdUnitId3 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/6115699204"; // Test ID
  }

  static String get medicineBannerAdUnitId3 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/2710197858"; // Test ID
  }

  static String get medicineBannerAdUnitId2 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/5088949181"; // Test ID
  }

  static String get medicineBannerAdUnitId1 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/4802617533"; // Test ID
  }

  static String get infoBannerAdUnitId1 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/5876026051"; // Test ID
  }

  static String get infoBannerAdUnitId2 {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/3489535863"; // Test ID
  }

  static String get reportBannerAdUnitID {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/9214589741";
    }
    return "ca-app-pub-8049150915836149/2462785849"; // Test ID
  }

  static String get labInterstitialAdUnitId {
    if (kDebugMode) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return "ca-app-pub-8049150915836149/3297964175"; // Test ID
  }
}
