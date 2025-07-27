import 'package:flutter/foundation.dart' show kDebugMode;

class AdMobAdIds {
  static const isRealAds = true;
  // Add more ad unit types here if needed
  static String get homeScreenbannerAdUnitId {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/8510169505'; // REAL ID
  }

  static String get diseasesBannerAdUnitId1 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/5884006166'; // Real ID
  }

  static String get diseasesBannerAdUnitId2 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/7515817882'; // REAL ID
  }

  static String get diseasesBannerAdUnitId3 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/6115699204'; // Real ID
  }

  static String get medicineBannerAdUnitId3 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/2710197858'; // Real ID
  }

  static String get medicineBannerAdUnitId2 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/5088949181'; // REAL ID
  }

  static String get medicineBannerAdUnitId1 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/4802617533'; // REAL ID
  }

  static String get infoBannerAdUnitId1 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/5876026051'; // REAL ID
  }

  static String get infoBannerAdUnitId2 {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/3489535863'; // REAL ID
  }

  static String get reportBannerAdUnitID {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/9214589741';
    }
    return 'ca-app-pub-8049150915836149/2462785849'; // REAL ID
  }

  static String get labInterstitialAdUnitId {
    if (kDebugMode || !isRealAds) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return 'ca-app-pub-8049150915836149/3297964175'; // REAL ID
  }
}
