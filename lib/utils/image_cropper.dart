import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CropImage {
  // private constractor
  CropImage._private();
  // single instance of the class
  static final CropImage _instance = CropImage._private();
  // get the already created instance everytime it calls
  factory CropImage() {
    return _instance;
  }
  // below all the function of the instance

  final title =
      'Please select desired area of the image that contains chicken faeces';
  //!WARNING: crop image
  Future<XFile?> cropImage(String imagePath, CropStyle? cropStyle) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      // aspectRatioPresets: [CropAspectRatioPreset.original],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title,
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false,
          hideBottomControls: true,
          cropStyle: cropStyle ?? CropStyle.rectangle,
        ),
        IOSUiSettings(
          title: title,
        ),
      ],
    );

    return croppedFile != null ? XFile(croppedFile.path) : null;
  }
}
