import 'dart:io';

import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

// late Interpreter interpreter;

// Future<void> loadModel() async {
//   try {
//     interpreter = await Interpreter.fromAsset(
//         'assets/models/model.tflite'); // Replace with your model path
//     // Or load from file:
//     // interpreter = await Interpreter.fromFile(File('path/to/your_model.tflite'));

//     // Optional: Get input and output details for more control.
//     var inputDetails = interpreter.getInputTensor(0);
//     var outputDetails = interpreter.getOutputTensor(0);

//     print('Input Type: ${inputDetails.type}');
//     print('Output Type: ${outputDetails.type}');
//     print('Input Shape: ${inputDetails.shape}');
//     print('Output Shape: ${outputDetails.shape}');
//   } catch (e) {
//     print('Error loading model: $e');
//   }
// }

// Uint8List imageToUint8List(img.Image image, int inputSize) {
//   var resizedImage = img.copyResize(image,
//       width: inputSize, height: inputSize); // Resize the image
//   var bytes = resizedImage.getBytes(format: img.Format.argb); // Get image bytes

//   // Convert to Uint8List (required for TFLite)
//   var buffer = Uint8List.view(bytes.buffer);
//   return buffer;
// }

// Future<Uint8List?> loadImageAndPrepare(File imageFile, int inputSize) async {
//   try {
//     var image = img.decodeImage(await imageFile.readAsBytes());
//     if (image != null) {
//       return imageToUint8List(image, inputSize);
//     } else {
//       print('Unable to decode image');
//       return null;
//     }
//   } catch (e) {
//     print('Error loading or preparing image: $e');
//     return null;
//   }
// }

// Future<List<double>?> runInference(Uint8List inputImage) async {
//   await loadModel();
//   try {
//     var inputTensor = interpreter.getInputTensor(0);
//     var outputTensor = interpreter.getOutputTensor(0);

//     // Create the output buffer (match the output type and shape)
//     var outputShape = outputTensor.shape;
//     var outputType = outputTensor.type;
//     var outputBuffer;

//     if (outputType == TfLiteType.kTfLiteFloat32) {
//       outputBuffer = Float32List(outputShape.reduce((a, b) => a * b));
//     } else if (outputType == TfLiteType.kTfLiteUInt8) {
//       outputBuffer = Uint8List(outputShape.reduce((a, b) => a * b));
//     } else {
//       print("Output Type not supported");
//       return null; // or handle other types as needed
//     }

//     // Run inference
//     interpreter.run(inputImage, outputBuffer);

//     return List<double>.from(
//         outputBuffer); // Convert to a list of doubles. Adjust as needed.
//   } catch (e) {
//     print('Error running inference: $e');
//     return null;
//   }
// }

// String getPrediction(List<double> output) {
//   // Find the index of the highest probability.
//   int maxIndex = output.indexOf(output.reduce((a, b) => a > b ? a : b));
//   // Assuming you have a list of labels
//   List<String> labels = [
//     'cocci',
//     'healthy',
//     'ncd',
//     'salmo'
//   ]; // Replace with your actual labels
//   return labels[maxIndex];
// }
