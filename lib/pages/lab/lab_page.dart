import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:poultrypal/pages/components/lang_change.dart';

import 'package:image/image.dart' as img;
import 'dart:typed_data';
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

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  bool isLoading = false;
  Future<void> _loadModel() async {
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

  Future<Uint8List?> _loadImageAndPrepare(File imageFile, int inputSize) async {
    try {
      var image = img.decodeImage(await imageFile.readAsBytes());
      if (image != null) {
        var resizedImage =
            img.copyResize(image, width: inputSize, height: inputSize);
        // ***KEY CHANGE: Convert to Uint8List correctly***
        var bytes =
            // resizedImage.getBytes(format: img.Format.rgb); // Use Format.rgb
            resizedImage.getBytes(
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

  Future<List<int>?> _runInference(Uint8List inputImage) async {
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

  List<double> _dequantize(List<int> output) {
    double scale = 0.00390625; // Your quantization scale
    return output.map((value) => value * scale).toList();
  }

  String _getPrediction(List<double> output) {
    // Assuming classification (adjust for your model's output)
    int maxIndex = output.indexOf(output.reduce((a, b) => a > b ? a : b));
    List<String> labels = [
      // 'class1',
      // 'class2',
      // 'class3',
      // 'class4'
      'cocci',
      'healthy',
      'ncd',
      'salmo'
    ]; // Your labels
    return labels[maxIndex];
  }

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
                          var inputImage = await _loadImageAndPrepare(
                              imageFile, 224); // Example size
                          if (inputImage != null) {
                            var output = await _runInference(inputImage);
                            if (output != null) {
                              List<double> dequantizedOutput =
                                  _dequantize(output);
                              String prediction =
                                  _getPrediction(dequantizedOutput);

                              setState(() {
                                _prediction = prediction;
                                print("Prediction -> $prediction");
                                isLoading = false;
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                  child: Text("Predict")),
          ],
        ),
      ),
    );
  }
}
