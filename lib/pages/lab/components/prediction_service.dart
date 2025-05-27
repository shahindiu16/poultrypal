import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// prediction_service2.dart
class PredictionService {
  late final ImageLabeler _imageLabeler;
  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      final modelPath = await getModelPath();
      if (modelPath == null) throw Exception('Model path not available.');
      final LocalLabelerOptions options = LocalLabelerOptions(
        modelPath: modelPath,
        confidenceThreshold: 0.8,
        maxCount: 20,
      );
      _imageLabeler = ImageLabeler(options: options);
      _modelLoaded = true;
      debugPrint('Model loaded successfully');
    } catch (e) {
      debugPrint('Error loading model: $e');
      _modelLoaded = false;
    }
  }

  Future<String?> getModelPath() async {
    try {
      final asset = 'assets/models/model.tflite';
      final appDir = await getApplicationSupportDirectory();
      final fullPath = join(appDir.path, asset);

      await Directory(dirname(fullPath)).create(recursive: true);
      final file = File(fullPath);
      if (!await file.exists()) {
        final byteData = await rootBundle.load(asset);
        await file.writeAsBytes(
          byteData.buffer
              .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
        );
      }
      return file.path;
    } catch (e) {
      debugPrint("Error in getModelPath -> $e");
      return null;
    }
  }

  Future<List<ImageLabel>?> processImage(InputImage inputImage) async {
    try {
      final List<ImageLabel> labels =
          await _imageLabeler.processImage(inputImage);
      return labels;
    } catch (e) {
      debugPrint('Error labeling image: $e');
      return null;
    }
  }

  Future<InputImage?> loadImageAndPrepare(File imageFile) async {
    try {
      return InputImage.fromFile(imageFile);
    } catch (e) {
      debugPrint('Error loading or preparing image: $e');
      return null;
    }
  }

  // (String, String) getPrediction(List<ImageLabel> labels) {
  //   if (labels.isNotEmpty) {
  //     ImageLabel bestLabel =
  //         labels.reduce((a, b) => a.confidence > b.confidence ? a : b);
  //
  //     return (
  //       bestLabel.label,
  //       (bestLabel.confidence * 100).toStringAsFixed(2)
  //     ); // 0.80 => 80.00%
  //   } else {
  //     return ("Not a valid image!!", "100");
  //   }
  // }

  (String, String) getPrediction(List<ImageLabel> labels) {
    const double confidenceThreshold = 0.80;

    // Filter out labels below the threshold
    final highConfidenceLabels = labels
        .where((label) => label.confidence >= confidenceThreshold)
        .toList();

    if (highConfidenceLabels.isNotEmpty) {
      // Pick the most confident label
      final bestLabel = highConfidenceLabels.reduce(
        (a, b) => a.confidence > b.confidence ? a : b,
      );

      return (bestLabel.label, (bestLabel.confidence * 100).toStringAsFixed(2));
    } else {
      return ("Prediction confidence too low", "N/A");
    }
  }

  void dispose() {
    _imageLabeler.close(); // Important: Close the labeler when done
  }
}
