// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:poultrypal/admob/widgest/consent_manager.dart';

// /// An example app that loads a banner ad.
// class BannerAds extends StatefulWidget {
//   const BannerAds({required this.adsize, required this.adUnitId, super.key});
//   final AdSize adsize;
//   final String adUnitId;

//   @override
//   BannerAdsState createState() => BannerAdsState();
// }

// class BannerAdsState extends State<BannerAds> {
//   final _consentManager = ConsentManager();
//   var _isMobileAdsInitializeCalled = false;
//   bool _isPrivacyOptionsRequired = false;
//   BannerAd? _bannerAd;
//   bool _isLoaded = false;
//   Orientation? _currentOrientation;

//   @override
//   void initState() {
//     super.initState();

//     _consentManager.gatherConsent((consentGatheringError) {
//       if (consentGatheringError != null) {
//         // Consent not obtained in current session.
//         debugPrint(
//             '${consentGatheringError.errorCode}: ${consentGatheringError.message}');
//       }

//       // Check if a privacy options entry point is required.
//       _getIsPrivacyOptionsRequired();

//       // Attempt to initialize the Mobile Ads SDK.
//       _initializeMobileAdsSDK();
//     });

//     // This sample attempts to load ads using consent obtained in the previous session.
//     _initializeMobileAdsSDK();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         if (_currentOrientation != orientation) {
//           _isLoaded = false;
//           _loadAd();
//           _currentOrientation = orientation;
//         }
//         return Stack(
//           children: [
//             if (_bannerAd != null && _isLoaded)
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SafeArea(
//                   child: Container(
//                     // padding: EdgeInsets.all(2),
//                     width: _bannerAd!.size.width.toDouble(),
//                     height: _bannerAd!.size.height.toDouble(),
//                     child: AdWidget(ad: _bannerAd!),
//                   ),
//                 ),
//               )
//           ],
//         );
//       },
//     );
//   }

//   /// Loads and shows a banner ad.
//   ///
//   /// Dimensions of the ad are determined by the width of the screen.
//   void _loadAd() async {
//     // Only load an ad if the Mobile Ads SDK has gathered consent aligned with
//     // the app's configured messages.
//     final canRequestAds = await _consentManager.canRequestAds();
//     if (!canRequestAds) {
//       return;
//     }

//     if (!mounted) {
//       return;
//     }

//     // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
//     final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
//         MediaQuery.sizeOf(context).width.truncate());

//     if (size == null) {
//       // Unable to get width of anchored banner.
//       return;
//     }

//     BannerAd(
//       adUnitId: widget.adUnitId,
//       request: const AdRequest(),
//       // size: size,
//       size: widget.adsize,
//       listener: BannerAdListener(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           setState(() {
//             _bannerAd = ad as BannerAd;
//             _isLoaded = true;
//           });
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (ad, err) {
//           ad.dispose();
//         },
//         // Called when an ad opens an overlay that covers the screen.
//         onAdOpened: (Ad ad) {},
//         // Called when an ad removes an overlay that covers the screen.
//         onAdClosed: (Ad ad) {},
//         // Called when an impression occurs on the ad.
//         onAdImpression: (Ad ad) {},
//       ),
//     ).load();
//   }

//   /// Redraw the app bar actions if a privacy options entry point is required.
//   void _getIsPrivacyOptionsRequired() async {
//     if (await _consentManager.isPrivacyOptionsRequired()) {
//       setState(() {
//         _isPrivacyOptionsRequired = true;
//       });
//     }
//   }

//   /// Initialize the Mobile Ads SDK if the SDK has gathered consent aligned with
//   /// the app's configured messages.
//   void _initializeMobileAdsSDK() async {
//     if (_isMobileAdsInitializeCalled) {
//       return;
//     }

//     if (await _consentManager.canRequestAds()) {
//       _isMobileAdsInitializeCalled = true;

//       // Initialize the Mobile Ads SDK.
//       MobileAds.instance.initialize();

//       // Load an ad.
//       _loadAd();
//     }
//   }

//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
// }
