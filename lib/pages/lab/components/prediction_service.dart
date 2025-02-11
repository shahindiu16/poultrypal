import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

import 'package:tflite_flutter/tflite_flutter.dart';

class PredictionService {
  late Interpreter interpreter;
  bool _modelLoaded = false; // Track model loading status

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/models/model.tflite');
      print('Model loaded successfully');

      var inputDetails = interpreter.getInputTensor(0);
      var outputDetails = interpreter.getOutputTensor(0);

      print('Input Type: ${inputDetails.type}');
      print('Output Type: ${outputDetails.type}');
      print('Input Shape: ${inputDetails.shape}');
      print('Output Shape: ${outputDetails.shape}');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<Uint8List?> loadImageAndPrepare(File imageFile, int inputSize) async {
    try {
      var image = img.decodeImage(await imageFile.readAsBytes());
      if (image != null) {
        var resizedImage =
            img.copyResize(image, width: inputSize, height: inputSize);
        // ***KEY CHANGE: Convert to Uint8List correctly***
        var bytes = resizedImage.getBytes(
            order: img.ChannelOrder.rgb); // Use Format.rgb
        return Uint8List.fromList(bytes);
      } else {
        print('Unable to decode image');
        return null;
      }
    } catch (e) {
      print('Error loading or preparing image: $e');
      return null;
    }
  }

  Future<List<int>?> runInference(Uint8List inputImage) async {
    try {
      final isolateInterpreter =
          await IsolateInterpreter.create(address: interpreter.address);
      var outputTensor = interpreter.getOutputTensor(0);
      var outputShape = outputTensor.shape;
      var outputType = outputTensor.type;

      if (outputType.value == TfLiteType.kTfLiteUInt8) {
        var outputBuffer = Uint8List(outputShape.reduce((a, b) => a * b));
        isolateInterpreter.run(inputImage, outputBuffer);
        return outputBuffer.toList();
      } else {
        print("Output Type ${outputType} not supported. Expected uint8.");
        return null;
      }
    } catch (e) {
      print('Error running inference: $e');
      return null;
    }
  }

  List<double> dequantize(List<int> output) {
    double scale = 0.00390625; // Your quantization scale
    return output.map((value) => value * scale).toList();
  }

  String getPrediction(List<double> output) {
    // Assuming classification (adjust for your model's output)
    int maxIndex = output.indexOf(output.reduce((a, b) => a > b ? a : b));
    List<String> labels = [
      // 'class1',
      // 'class2',
      // 'class3',
      // 'class4'
      'Not a valid Image',
      'cocci',
      'healthy',
      'ncd',
      'salmo'
    ]; // Your labels
    return labels[maxIndex];
  }

  bool isModelLoaded() {
    return _modelLoaded;
  }
}

// prediction_service2.dart
class PredictionService2 {
  final ImageLabeler _imageLabeler =
      ImageLabeler(options: ImageLabelerOptions());
  bool _modelLoaded =
      true; // google_ml_kit models are usually readily available

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
      var image = img.decodeImage(await imageFile.readAsBytes());
      if (image != null) {
        return InputImage.fromFile(imageFile);
        // var resizedImage =
        //     img.copyResize(image, width: inputSize, height: inputSize);

        // // Convert the resized image to InputImage
        // var bytes = resizedImage.getBytes(
        //     order: img.ChannelOrder.rgb); // Use Format.rgb
        // return InputImage.fromBytes(
        //     bytes: Uint8List.fromList(bytes),
        //     // inputImageData: ,
        //     metadata: InputImage(
        //       size: Size(resizedImage.width.toDouble(),
        //           resizedImage.height.toDouble()),
        //       imageRotation:
        //           InputImageRotation.rotation90deg, // Adjust as needed
        //       formatType: InputImageFormat.BGRA_8888, // Adjust as needed
        //     ),
        //     );
      } else {
        print('Unable to decode image');
        return null;
      }
    } catch (e) {
      print('Error loading or preparing image: $e');
      return null;
    }
  }

  String getPrediction(List<ImageLabel> labels) {
    if (labels.isNotEmpty) {
      // Get the label with the highest confidence
      ImageLabel bestLabel =
          labels.reduce((a, b) => a.confidence > b.confidence ? a : b);
      return bestLabel.label;
    } else {
      return "No labels found";
    }
  }

  void dispose() {
    _imageLabeler.close(); // Important: Close the labeler when done
  }
}
