import 'dart:io';

class AdMobAdIds {
  // static String? get testDeviceID {
  //   if (Platform.isAndroid) {
  //     return "YOUR_ANDROID_TEST_DEVICE_ID";
  //   } else if (Platform.isIOS) {
  //     return "YOUR_IOS_TEST_DEVICE_ID";
  //   }
  //   return null;
  // }

  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300973250"; // Test ID
      // return "YOUR_ANDROID_BANNER_AD_UNIT_ID";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716"; // Test ID
      // return "YOUR_IOS_BANNER_AD_UNIT_ID";
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712"; // Test ID
      // return "YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910"; // Test ID
      // return "YOUR_IOS_INTERSTITIAL_AD_UNIT_ID";
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917"; // Test ID
      // return "YOUR_ANDROID_REWARDED_AD_UNIT_ID";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712489072"; // Test ID
      // return "YOUR_IOS_REWARDED_AD_UNIT_ID";
    }
    return null;
  }

  // Add more ad unit types here if needed
}
