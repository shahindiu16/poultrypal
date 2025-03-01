import 'dart:async';
import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/admob/admob_ids.dart';
import 'package:poultrypal/admob/widgest/banner_ads.dart';
import 'package:poultrypal/admob/widgest/consent_manager.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/components/lang_change.dart';
import 'package:poultrypal/pages/lab/components/image_preview_card.dart';
import 'package:poultrypal/pages/lab/components/prediction_service.dart';
import 'package:poultrypal/pages/lab/components/time_n_accuracy_card.dart';
import 'package:poultrypal/utils/utilts.dart';

class ImagePreviewPage extends StatefulWidget {
  final String imagePath;

  const ImagePreviewPage({super.key, required this.imagePath});

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

enum ReportList {
  diseaseDetected,
  genericMedicine,
  severityLevel,
  deathRate,
  prevension,
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  String _prediction = 'No prediction yet';
  String _accuracy = '';
  int? timeTook;

  ReportList getReportListFromTitle(String title) {
    if (title == "Disease Detected" || title == "শনাক্তকৃত রোগ") {
      return ReportList.diseaseDetected;
    } else if (title == "Generic Medicine" || title == "জেনেরিক ওষুধ") {
      return ReportList.genericMedicine;
    } else if (title == "Severity Level" || title == "তীব্রতার স্তর") {
      return ReportList.severityLevel;
    } else if (title == "Death Rate" || title == "মৃত্যুহার") {
      return ReportList.deathRate;
    } else if (title == "Prevention" || title == "প্রতিরোধ") {
      return ReportList.prevension;
    }
    return ReportList.diseaseDetected;
  }

  String getContent(
      AppLocalizations? i10, ImagePrediction imp, ReportList rst) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
      case ImagePrediction.healthy:
        return "";
      case ImagePrediction.salmo:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedSalmo ?? "";
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicineSalmo ?? "";
          case ReportList.severityLevel:
            return i10?.contentseverityLevelSalmo ?? "";
          case ReportList.deathRate:
            return i10?.contentdeathRateSalmo ?? "";
          case ReportList.prevension:
            return i10?.contentprevensionSalmo ?? "";
        }
      case ImagePrediction.cocci:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedCocci ?? "";
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicineCocci ?? "";
          case ReportList.severityLevel:
            return i10?.contentseverityLevelCocci ?? "";
          case ReportList.deathRate:
            return i10?.contentdeathRateCocci ?? "";
          case ReportList.prevension:
            return i10?.contentprevensionCocci ?? "";
        }
      case ImagePrediction.ncd:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedncd ?? "";
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicinencd ?? "";
          case ReportList.severityLevel:
            return i10?.contentseverityLevelncd ?? "";
          case ReportList.deathRate:
            return i10?.contentdeathRatencd ?? "";
          case ReportList.prevension:
            return i10?.contentprevensionncd ?? "";
        }
    }
  }

  final PredictionService _predictionService =
      PredictionService(); // Create instance

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

  ImagePrediction imgPrediction = ImagePrediction.notAValidImage;
  Future<void> _loadModel() async {
    await _predictionService.loadModel(); // Load using the service
    // if (!_predictionService.isModelLoaded()) {
    //   // Handle model loading failure, e.g., show an error message.
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Failed to load model.')),
    //   );
    // }

    final File imageFile = File(widget.imagePath);
    var inputImage = await _predictionService.loadImageAndPrepare(
        imageFile, 224); // Example size
    if (inputImage != null) {
      final stopwatch = Stopwatch();
      stopwatch.start();
      final labels = await _predictionService.processImage(inputImage);
      if (labels != null) {
        final prediction = _predictionService.getPrediction(labels);
        late ImagePrediction imp;
        if (prediction.$1 == 'cocci') {
          imp = ImagePrediction.cocci;
        } else if (prediction.$1 == 'healthy') {
          imp = ImagePrediction.healthy;
        } else if (prediction.$1 == 'ncd') {
          imp = ImagePrediction.ncd;
        } else if (prediction.$1 == 'salmo') {
          imp = ImagePrediction.healthy;
        } else {
          imp = ImagePrediction.notAValidImage;
        }
        stopwatch.stop();
        setState(() {
          _prediction = prediction.$1;
          _accuracy = prediction.$2;
          timeTook = stopwatch.elapsedMilliseconds;
          isLoading = false;
          imgPrediction = imp;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
      if (!_adsAlreadyShowed) _interstitialAd?.show();
    }
  }

  bool isLoading = true;

  String getSubtitle(AppLocalizations? i10, ImagePrediction imp) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
        return i10?.invalidImage ?? '';
      case ImagePrediction.healthy:
        return i10?.diseaseMap_healthy ?? '';
      case ImagePrediction.salmo:
        return i10?.diseaseMap_salmo ?? '';
      case ImagePrediction.cocci:
        return i10?.diseaseMap_cocci ?? '';
      case ImagePrediction.ncd:
        return i10?.diseaseMap_ncd ?? '';
    }
  }

  String getSubtitleGeneric(AppLocalizations? i10, ImagePrediction imp) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
        return '';
      case ImagePrediction.healthy:
        return i10?.medicine_healthy ?? '';
      case ImagePrediction.salmo:
        return i10?.medicine_salmo ?? '';
      case ImagePrediction.cocci:
        return i10?.medicine_cocci ?? '';
      case ImagePrediction.ncd:
        return i10?.medicine_ncd ?? '';
    }
  }

  String getSubtitleSeverity(AppLocalizations? i10, ImagePrediction imp) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
        return '';
      case ImagePrediction.healthy:
        return i10?.severity_healthy ?? '';
      case ImagePrediction.salmo:
        return i10?.severity_salmo ?? '';
      case ImagePrediction.cocci:
        return i10?.severity_cocci ?? '';
      case ImagePrediction.ncd:
        return i10?.severity_ncd ?? '';
    }
  }

  String getSubtitleDetahRate(AppLocalizations? i10, ImagePrediction imp) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
        return '';
      case ImagePrediction.healthy:
        return i10?.deathRate_healthy ?? '';
      case ImagePrediction.salmo:
        return i10?.deathRate_salmo ?? '';
      case ImagePrediction.cocci:
        return i10?.deathRate_cocci ?? '';
      case ImagePrediction.ncd:
        return i10?.deathRate_ncd ?? '';
    }
  }

  String getSubtitlePrevention(AppLocalizations? i10, ImagePrediction imp) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
        return i10?.invalidImage ?? '';
      case ImagePrediction.healthy:
        return i10?.diseaseMap_healthy ?? '';
      case ImagePrediction.salmo:
        return i10?.diseaseMap_salmo ?? '';
      case ImagePrediction.cocci:
        return i10?.diseaseMap_cocci ?? '';
      case ImagePrediction.ncd:
        return i10?.diseaseMap_ncd ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final File imageFile = File(widget.imagePath);
    final i10 = AppLocalizations.of(context);
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
            // slogan

            Text(i10?.slogan ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 16),
            // Image Preview Card
            ImagePreviewCard(imageFile: imageFile),
            const SizedBox(height: 16),
            BannerAds(
                adsize: AdSize.fullBanner, adUnitId: AdMobAdIds.bannerAdUnitId),
            const SizedBox(height: 16),
            if (!isLoading &&
                imgPrediction == ImagePrediction.notAValidImage) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeAndAccuracyCard(
                      value:
                          "${((timeTook ?? 0) / 1000).toStringAsFixed(2)} sec",
                      isTime: true),
                  SizedBox(
                    width: 30,
                  ),
                  TimeAndAccuracyCard(
                    value: "$_accuracy%",
                    isTime: false,
                  ),
                ],
              ),
              // Image Details Card
              SizedBox(
                height: 15,
              ),
              Text(i10?.invalidImage ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
            ],

            // time & accuracy
            if (!isLoading &&
                imgPrediction != ImagePrediction.notAValidImage) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeAndAccuracyCard(
                      value:
                          "${((timeTook ?? 0) / 1000).toStringAsFixed(2)} sec",
                      isTime: true),
                  SizedBox(
                    width: 30,
                  ),
                  TimeAndAccuracyCard(
                    value: "$_accuracy%",
                    isTime: false,
                  ),
                ],
              ),
              // Image Details Card
              SizedBox(
                height: 15,
              ),
              Text(i10?.diagnosisReportTitle ?? '',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),

              SizedBox(
                height: 15,
              ),

              DiagnosisReportCard(
                image: Assets.img.chicken2713365.path,
                title: i10?.diagnosisReportTitle1 ?? '',
                subtitle: getSubtitle(i10, imgPrediction),
                content: getContent(i10, imgPrediction,
                    getReportListFromTitle(i10?.diagnosisReportTitle1 ?? '')),
              ),
              SizedBox(
                height: 10,
              ),

              DiagnosisReportCard(
                image: Assets.img.firstAidKit2713349.path,
                title: i10?.diagnosisReportTitle2 ?? '',
                subtitle: getSubtitleGeneric(i10, imgPrediction),
                content: getContent(i10, imgPrediction,
                    getReportListFromTitle(i10?.diagnosisReportTitle2 ?? '')),
              ),
              SizedBox(
                height: 10,
              ),
              DiagnosisReportCard(
                image: Assets.img.diagram2713368.path,
                title: i10?.diagnosisReportTitle3 ?? '',
                subtitle: getSubtitleSeverity(i10, imgPrediction),
                content: getContent(i10, imgPrediction,
                    getReportListFromTitle(i10?.diagnosisReportTitle3 ?? '')),
              ),
              SizedBox(
                height: 10,
              ),
              DiagnosisReportCard(
                image: Assets.img.death2713357Copy.path,
                title: i10?.diagnosisReportTitle4 ?? '',
                subtitle: getSubtitleDetahRate(i10, imgPrediction),
                content: getContent(i10, imgPrediction,
                    getReportListFromTitle(i10?.diagnosisReportTitle4 ?? '')),
              ),
              SizedBox(
                height: 10,
              ),
              DiagnosisReportCard(
                image: Assets.img.protection2713342.path,
                title: i10?.diagnosisReportTitle5 ?? '',
                subtitle: getSubtitlePrevention(i10, imgPrediction),
                content: getContent(i10, imgPrediction,
                    getReportListFromTitle(i10?.diagnosisReportTitle5 ?? '')),
              ),
              SizedBox(
                height: 10,
              ),
            ],
            if (isLoading) Center(child: CircularProgressIndicator.adaptive())
          ],
        ),
      ),
    );
  }
}

class DiagnosisReportCard extends StatelessWidget {
  const DiagnosisReportCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.content,
  });
  final String image, title, subtitle, content;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        // 'Generic Medicine',
        title,
      ),
      subtitle: Text(
        // "Sulfonamides or lonophores like Amprolium.",
        subtitle,
      ),
      backgroundColor: Colors.white,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10), child: Image.asset(image)),
      children: [
        if (content.isNotEmpty)
          Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Text(
                // "",
                content,
              )),
      ],
    );
  }
}
