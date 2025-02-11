import 'dart:async';
import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/admob/widgest/consent_manager.dart';
import 'package:poultrypal/pages/components/lang_change.dart';

import 'package:poultrypal/pages/lab/components/prediction_service.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ImagePreviewPage extends StatefulWidget {
  final String imagePath;

  const ImagePreviewPage({super.key, required this.imagePath});

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  late Interpreter interpreter;
  String _prediction = 'No prediction yet';
  // final PredictionService _predictionService =
  //     PredictionService(); // Create instance

  final PredictionService2 _predictionService =
      PredictionService2(); // Create instance

  InterstitialAd? _interstitialAd;
  final _consentManager = ConsentManager();

  var _isMobileAdsInitializeCalled = false;
  bool _adsAlreadyShowed = false;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  @override
  void initState() {
    super.initState();
    _loadModel();
    _consentManager.gatherConsent((consentGatheringError) {
      if (consentGatheringError != null) {
        // Consent not obtained in current session.
        debugPrint(
            "${consentGatheringError.errorCode}: ${consentGatheringError.message}");
      }
    });

    // Attempt to initialize the Mobile Ads SDK.
    _initializeMobileAdsSDK();
  }

  void _initializeMobileAdsSDK() async {
    if (_isMobileAdsInitializeCalled) {
      return;
    }

    if (await _consentManager.canRequestAds()) {
      _isMobileAdsInitializeCalled = true;

      // Initialize the Mobile Ads SDK.
      MobileAds.instance.initialize();

      // Load an ad.
      _loadAd();
    }
  }

  void _loadAd() async {
    // Only load an ad if the Mobile Ads SDK has gathered consent aligned with
    // the app's configured messages.
    var canRequestAds = await _consentManager.canRequestAds();
    if (!canRequestAds) {
      return;
    }

    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  setState(() {
                    _adsAlreadyShowed = true;
                  });
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _predictionService.dispose();
    super.dispose();
  }

  Future<void> _loadModel() async {
    // await _predictionService.loadModel(); // Load using the service
    // if (!_predictionService.isModelLoaded()) {
    //   // Handle model loading failure, e.g., show an error message.
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Failed to load model.')),
    //   );
    // }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final File imageFile = File(widget.imagePath);
    final i10 = AppLocalizations.of(context);
    final fileName = imageFile.path.split('/').last;
    // imageFile.readAsBytes
    final fileSize =
        (imageFile.lengthSync() / 1024).toStringAsFixed(2); // In KB

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Report'),
        actions: [
          LangChangeBtn(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Preview Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      i10?.imagePreview ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          // height: 250,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // BannerAds(
            //     adsize: AdSize.fullBanner, adUnitId: AdMobAdIds.bannerAdUnitId),
            const SizedBox(height: 16),
            // Image Details Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prediction: $_prediction',
                    ),
                    // const SizedBox(height: 8),
                    // Text('File Size: $fileSize KB',
                    //     style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            if (isLoading)
              Center(child: CircularProgressIndicator.adaptive())
            else
              ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          // final out = await loadModel(await imageFile.readAsBytes());
                          var inputImage =
                              await _predictionService.loadImageAndPrepare(
                                  imageFile, 224); // Example size
                          if (inputImage != null) {
                            final labels = await _predictionService
                                .processImage(inputImage);
                            if (labels != null) {
                              String prediction =
                                  _predictionService.getPrediction(labels);
                              setState(() {
                                _prediction = prediction;
                                isLoading = false;
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                            // var output = await _predictionService
                            //     .runInference(inputImage);
                            // if (output != null) {
                            //   List<double> dequantizedOutput =
                            //       _predictionService.dequantize(output);
                            //   String prediction = _predictionService
                            //       .getPrediction(dequantizedOutput);

                            //   setState(() {
                            //     _prediction = prediction;
                            //     print("Prediction -> $prediction");
                            //     isLoading = false;
                            //   });
                            // } else {
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            // }

                            if (!_adsAlreadyShowed) _interstitialAd?.show();
                          }
                        },
                  child: Text("Predict")),
          ],
        ),
      ),
    );
  }
}
