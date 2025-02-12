import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// prediction_service2.dart
class PredictionService {
  late final ImageLabeler _imageLabeler;
  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      final modelPath = await getModelPath();
      final LocalLabelerOptions options = LocalLabelerOptions(
        modelPath: modelPath,
        confidenceThreshold: 0.8,
      );
      _imageLabeler = ImageLabeler(options: options);
      _modelLoaded = true;
      print('Model loaded successfully');
    } catch (e) {
      print('Error loading model: $e');
      _modelLoaded = false;
    }
  }

  Future<String> getModelPath() async {
    const asset = 'assets/models/model.tflite';
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  Future<List<ImageLabel>?> processImage(InputImage inputImage) async {
    try {
      final List<ImageLabel> labels =
          await _imageLabeler.processImage(inputImage);
      return labels;
    } catch (e) {
      print('Error labeling image: $e');
      return null;
    }
  }

  Future<InputImage?> loadImageAndPrepare(File imageFile, int inputSize) async {
    try {
      return InputImage.fromFile(imageFile);
    } catch (e) {
      print('Error loading or preparing image: $e');
      return null;
    }
  }

  (String, String) getPrediction(List<ImageLabel> labels) {
    if (labels.isNotEmpty) {
      // Get the label with the highest confidence
      ImageLabel bestLabel =
          labels.reduce((a, b) => a.confidence > b.confidence ? a : b);
      return (bestLabel.label, (bestLabel.confidence * 100).toStringAsFixed(2));
    } else {
      return ("Not a valid image!!", "100");
    }
  }

  void dispose() {
    _imageLabeler.close(); // Important: Close the labeler when done
  }
}
