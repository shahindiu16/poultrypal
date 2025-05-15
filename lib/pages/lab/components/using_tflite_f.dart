import 'dart:io';
// import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredictionService2 {
  late Interpreter _interpreter;
  late List<String> _labels;

  final int inputSize = 224; // Adjust based on your model
  final bool isModelQuantized = false; // Set to true if model is quantized
  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      final modelPath = await _getModelPath();
      if (modelPath == null) throw Exception('Model path not available');
      _interpreter = Interpreter.fromFile(File(modelPath));
      _labels = await _loadLabels('assets/models/labels.txt');
      _modelLoaded = true;
      debugPrint('Model loaded ✅');
    } catch (e) {
      debugPrint('❌ Error loading model: $e');
      _modelLoaded = false;
    }
  }

  Future<String?> _getModelPath() async {
    const asset = 'assets/models/model.tflite';
    try {
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

  Future<List<String>> _loadLabels(String assetPath) async {
    final rawLabels = await rootBundle.loadString(assetPath);
    return rawLabels
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  Future<(String, String)?> predict(File imageFile) async {
    if (!_modelLoaded) return null;

    final img.Image? oriImage = img.decodeImage(await imageFile.readAsBytes());
    if (oriImage == null) return ('Invalid image', '0');

    final int width = 224;
    final int height = 224;

    final img.Image resized =
        img.copyResize(oriImage, width: width, height: height);

    // Input shape: [1, 224, 224, 3], type: uint8
    final input = List.generate(
      1,
      (_) => List.generate(
        height,
        (y) => List.generate(
          width,
          (x) {
            final pixel = resized.getPixel(x, y);
            final r = (pixel.r);
            final g = (pixel.g);
            final b = (pixel.b);

            return [r, g, b];
          },
        ),
      ),
    );

    // Output shape: [1, numLabels]
    final outputShape = _interpreter.getOutputTensor(0).shape;
    final output =
        List<int>.filled(outputShape[1], 0).reshape([1, outputShape[1]]);
    try {
      // final isolateInterpreter =
      //     await IsolateInterpreter.create(address: _interpreter.address);
      // isolateInterpreter.run(input, output);
      _interpreter.run(input, output);
    } catch (e) {
      debugPrint("❌ Interpreter error: $e");
      return ('Interpreter error', '0');
    }
    debugPrint("🥡 $output");
    final scores = output[0].map((e) => e.toDouble()).toList();
    debugPrint("🥡 s: $scores");
    final maxIdx =
        scores.indexWhere((e) => e == scores.reduce((a, b) => a > b ? a : b));
    debugPrint("🥡 maxIDX: $maxIdx || $_labels");

    final label = _labels[maxIdx];
    final confidence = (scores[maxIdx] * 100 / 255)
        .toStringAsFixed(2); // since output is uint8 0–255

    return (label, confidence.toString());
  }

  /// Converts an image to a Float32 input buffer (for non-quantized models)
  // Uint8List _imageToByteList(img.Image image) {
  //   // Shape: [1, 224, 224, 3]
  //   final List<double> imageAsFloat32 = [];

  //   for (int y = 0; y < inputSize; y++) {
  //     for (int x = 0; x < inputSize; x++) {
  //       final pixel = image.getPixel(x, y);
  //       final r = pixel.r;
  //       final g = pixel.g;
  //       final b = pixel.b;

  //       if (isModelQuantized) {
  //         // uint8 quantized model, use 0–255
  //         imageAsFloat32.addAll([r.toDouble(), g.toDouble(), b.toDouble()]);
  //       } else {
  //         // float32 model, normalize to [-1, 1]
  //         imageAsFloat32.addAll([
  //           (r / 127.5) - 1.0,
  //           (g / 127.5) - 1.0,
  //           (b / 127.5) - 1.0,
  //         ]);
  //       }
  //     }
  //   }

  //   final Float32List floatList = Float32List.fromList(imageAsFloat32);
  //   return floatList.buffer.asUint8List();
  // }

  void dispose() {
    _interpreter.close();
  }
}
