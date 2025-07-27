import 'dart:async';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poultrypal/admob/admob_ids.dart';
import 'package:poultrypal/admob/widgest/consent_manager.dart';
import 'package:poultrypal/admob/widgest/my_banner_ads.dart' show MyBannerAdWidget;
import 'package:poultrypal/l10n/app_localizations.dart';
import 'package:poultrypal/pages/lab/components/diagnose_report_card.dart';
import 'package:poultrypal/utils/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/components/lang_change.dart';
import 'package:poultrypal/pages/lab/components/image_preview_card.dart';
import 'package:poultrypal/pages/lab/components/prediction_service.dart';
import 'package:poultrypal/pages/lab/components/time_n_accuracy_card.dart';
import 'package:poultrypal/utils/utilts.dart';

class ImagePreviewPage extends StatefulWidget {

  ImagePreviewPage({required this.imagePath, super.key});
  String imagePath;

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

const int maxFailedLoadAttempts = 3;

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  var _prediction = 'No prediction yet';
  String _accuracy = '';
  int? timeTook;
  // tfl.Interpreter? _interpreter;
  final Map<String, ReportList> _reportListMap = {
    'Disease Detected': ReportList.diseaseDetected,
    'শনাক্তকৃত রোগ': ReportList.diseaseDetected,
    'Generic Medicine': ReportList.genericMedicine,
    'জেনেরিক ওষুধ': ReportList.genericMedicine,
    'Severity Level': ReportList.severityLevel,
    'তীব্রতার স্তর': ReportList.severityLevel,
    'Death Rate': ReportList.deathRate,
    'মৃত্যুহার': ReportList.deathRate,
    'Prevention': ReportList.prevension,
    'প্রতিরোধ': ReportList.prevension,
  };

  ReportList getReportListFromTitle(String title) {
    return _reportListMap[title] ?? ReportList.diseaseDetected;
  }

  String getContent(
      AppLocalizations? i10, ImagePrediction imp, ReportList rst) {
    switch (imp) {
      case ImagePrediction.notAValidImage:
      case ImagePrediction.healthy:
        return '';
      case ImagePrediction.salmo:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedSalmo ?? '';
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicineSalmo ?? '';
          case ReportList.severityLevel:
            return i10?.contentseverityLevelSalmo ?? '';
          case ReportList.deathRate:
            return i10?.contentdeathRateSalmo ?? '';
          case ReportList.prevension:
            return i10?.contentprevensionSalmo ?? '';
        }
      case ImagePrediction.cocci:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedCocci ?? '';
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicineCocci ?? '';
          case ReportList.severityLevel:
            return i10?.contentseverityLevelCocci ?? '';
          case ReportList.deathRate:
            return i10?.contentdeathRateCocci ?? '';
          case ReportList.prevension:
            return i10?.contentprevensionCocci ?? '';
        }
      case ImagePrediction.ncd:
        switch (rst) {
          case ReportList.diseaseDetected:
            return i10?.contentdiseaseDetectedncd ?? '';
          case ReportList.genericMedicine:
            return i10?.contentgenericMedicinencd ?? '';
          case ReportList.severityLevel:
            return i10?.contentseverityLevelncd ?? '';
          case ReportList.deathRate:
            return i10?.contentdeathRatencd ?? '';
          case ReportList.prevension:
            return i10?.contentprevensionncd ?? '';
        }
    }
  }

  final PredictionService _predictionService =
      PredictionService(); // Create instance

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  final _consentManager = ConsentManager();

  final _isMobileAdsInitializeCalled = false;
  bool _adsAlreadyShowed = false;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
    // Attempt to initialize the Mobile Ads SDK.
    _loadModel();
    _consentManager.gatherConsent((consentGatheringError) {
      if (consentGatheringError != null) {
        // Consent not obtained in current session.
        debugPrint(
            '${consentGatheringError.errorCode}: ${consentGatheringError.message}');
      }
    });
  }

  void _createInterstitialAd() {
    debugPrint('CREATING INTERSTITIALAD......');
    InterstitialAd.load(
        // adUnitId: AdMobAdIds.testInterstitialAdUnitId,
        adUnitId: AdMobAdIds.labInterstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            debugPrint('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
            // _showInterstitialAd();
            if (!_adsAlreadyShowed) {
              _showInterstitialAd();
            }
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error.');

            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      debugPrint('Warning: attempt to show interstitial before loaded.');
      return;
    }
    // if (_adsAlreadyShowed) {
    //   return;
    // }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          debugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
    _adsAlreadyShowed = true;
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
    final imageFile = File(widget.imagePath);
    final inputImage =
        await _predictionService.loadImageAndPrepare(imageFile); // Example size
    if (inputImage != null) {
      final stopwatch = Stopwatch()
      ..start();
      final labels = await _predictionService.processImage(inputImage);
      if (labels != null) {
        final prediction = _predictionService.getPrediction(labels);
        final imp = mapLabelToEnum(prediction.$1);
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
    }
  }

  Future<void> _doAnotherPrediction(String newFile) async {
    await _predictionService.loadModel(); // Load using the service
    final imageFile = File(newFile);
    final inputImage =
        await _predictionService.loadImageAndPrepare(imageFile); // Example size
    if (inputImage != null) {
      final stopwatch = Stopwatch()
      ..start();
      final labels = await _predictionService.processImage(inputImage);
      if (labels != null) {
        final prediction = _predictionService.getPrediction(labels);
        final imp = mapLabelToEnum(prediction.$1);
        stopwatch.stop();
        setState(() {
          _prediction = prediction.$1;
          _accuracy = prediction.$2;
          timeTook = stopwatch.elapsedMilliseconds;
          isLoading = false;
          imgPrediction = imp;
        });
        _showInterstitialAd();
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
    // _showInterstitialAd();
  }

  // pick another image
  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final smng = ScaffoldMessenger.of(context);
    final loca = AppLocalizations.of(context);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 85);

    final cp = CropImage();
    if (pickedFile != null) {
      final croppedImage =
          await cp.cropImage(pickedFile.path, CropStyle.rectangle);
      // onImageSelected(pickedFile.path);
      if (croppedImage != null) {
        widget.imagePath = croppedImage.path;
        _doAnotherPrediction(croppedImage.path);
      }
    } else {
      smng.showSnackBar(
        SnackBar(content: Text(loca?.noImageSelected ?? 'No image selected')),
      );
    }
  }

  /* 
  0 cocci
  1 healthy
  2 ncd
  3 salmo 
  */

  bool isLoading = true;
  // map label to enum
  ImagePrediction mapLabelToEnum(String label) {
    debugPrint('this is label: $label');
    switch (label.toLowerCase()) {
      case 'coccidiosis':
        return ImagePrediction.cocci;
      case 'healthy':
        return ImagePrediction.healthy;
      case 'salmonella': // Same label
        return ImagePrediction.salmo;
      case 'new castle disease':
        return ImagePrediction.ncd;
      default:
        return ImagePrediction.notAValidImage;
    }
  }

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

  // // PREDICTION SERVICE 3 [test]
  // Future<void> predictionService3(String image) async {
  //   var res = await Tflite.loadModel(
  //     model: "assets/models/model.tflite",
  //     labels: "assets/models/labels.txt",
  //   );
  //   debugPrint("load model res: $res");
  //   var recognitions = await Tflite.runModelOnImage(
  //     path: image, // required
  //   );
  //   debugPrint("recognitions : $recognitions");
  //   await Tflite.close();
  // }

  @override
  Widget build(BuildContext context) {
    final imageFile = File(widget.imagePath);
    final i10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Report'),
        actions: const [
          LangChangeBtn(),
        ],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // slogan

          Text(i10?.slogan ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(height: 16),
          // Image Preview Card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImagePreviewCard(
              imageFile: imageFile,
              // onImageSelected: (String imagePath) {
              //   _doAnotherPrediction(imagePath);
              // },
            ),
          ),
          const SizedBox(height: 16),

          // NOTE: ADMOB
          // BannerAds(
          //   adsize: AdSize.fullBanner,
          //   // adUnitId: AdMobAdIds.testBannerAdUnitId,
          //   adUnitId: AdMobAdIds.reportBannerAdUnitID,
          // ),
          MyBannerAdWidget (adUnitId: AdMobAdIds.reportBannerAdUnitID,),
          const SizedBox(height: 16),

          // time & accuracy
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeAndAccuracyCard(
                  value: '${((timeTook ?? 0) / 1000).toStringAsFixed(2)} sec',
                  isTime: true),
              const SizedBox(
                width: 30,
              ),
              TimeAndAccuracyCard(
                value: '$_accuracy%',
                isTime: false,
              ),
            ],
          ),
          if (!isLoading &&
              imgPrediction == ImagePrediction.notAValidImage) ...[
            // Image Details Card
            const SizedBox(
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
            // Image Details Card
            const SizedBox(
              height: 15,
            ),
            Text(i10?.diagnosisReportTitle ?? '',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),

            const SizedBox(
              height: 15,
            ),

            DiagnosisReportCard(
              image: Assets.img.chicken2713365.path,
              title: i10?.diagnosisReportTitle1 ?? '',
              subtitle: getSubtitle(i10, imgPrediction),
              content: getContent(i10, imgPrediction,
                  getReportListFromTitle(i10?.diagnosisReportTitle1 ?? '')),
            ),
            const SizedBox(
              height: 10,
            ),

            /// branded medicine
            if (imgPrediction!=ImagePrediction.healthy && imgPrediction!=ImagePrediction.notAValidImage)
            DiagnosisReportCard2(
              image: Assets.img.medical13854010.path,
              title: i10?.brandedMedicine ?? '',
              imp:imgPrediction ,
            ),
            const SizedBox(
              height: 10,
            ),

            DiagnosisReportCard(
              image: Assets.img.firstAidKit2713349.path,
              title: i10?.diagnosisReportTitle2 ?? '',
              subtitle: getSubtitleGeneric(i10, imgPrediction),
              content: getContent(i10, imgPrediction,
                  getReportListFromTitle(i10?.diagnosisReportTitle2 ?? '')),
            ),
            const SizedBox(
              height: 10,
            ),
            DiagnosisReportCard(
              image: Assets.img.diagram2713368.path,
              title: i10?.diagnosisReportTitle3 ?? '',
              subtitle: getSubtitleSeverity(i10, imgPrediction),
              content: getContent(i10, imgPrediction,
                  getReportListFromTitle(i10?.diagnosisReportTitle3 ?? '')),
            ),
            const SizedBox(
              height: 10,
            ),
            DiagnosisReportCard(
              image: Assets.img.death2713357Copy.path,
              title: i10?.diagnosisReportTitle4 ?? '',
              subtitle: getSubtitleDetahRate(i10, imgPrediction),
              content: getContent(i10, imgPrediction,
                  getReportListFromTitle(i10?.diagnosisReportTitle4 ?? '')),
            ),
            const SizedBox(
              height: 10,
            ),
            DiagnosisReportCard(
              image: Assets.img.protection2713342.path,
              title: i10?.diagnosisReportTitle5 ?? '',
              subtitle: getSubtitlePrevention(i10, imgPrediction),
              content: getContent(i10, imgPrediction,
                  getReportListFromTitle(i10?.diagnosisReportTitle5 ?? '')),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
          if (isLoading)
            const Center(
                child: CircularProgressIndicator
                    .adaptive()), // show the two btns

          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(i10?.chooseImage ?? 'Choose Another image'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () =>
                              _pickImage(context, ImageSource.camera),
                          icon: const Icon(Icons.camera_alt),
                          label: Text(
                            i10?.takePicture ?? 'Take Picture',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () =>
                              _pickImage(context, ImageSource.gallery),
                          icon: const Icon(Icons.photo_library),
                          label: Text(
                            i10?.selectFromGallery ?? 'Select from Gallery',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
