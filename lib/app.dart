import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:poultrypal/l10n/app_localizations.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/components/lang_change.dart';
import 'package:poultrypal/pages/home/home.dart';
import 'package:poultrypal/pages/info/info.dart';
import 'package:poultrypal/pages/lab/lab_page.dart';
import 'package:poultrypal/utils/image_cropper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curr = 0;

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          actions: [
            LangChangeBtn(),
          ],
          backgroundColor: Color(0xfff8f9fa),
          leading: Assets.icon.image(),
          title: Text(AppLocalizations.of(context)!.appTitle),
        ),
        body: curr == 0 ? HomePage() : InfoPage(),
        floatingActionButton: FabPie(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          key: UniqueKey(), backgroundColor: Color(0xff373A36),
          icons: [Icons.home, Icons.info],
          activeIndex: curr,
          activeColor: Colors.orangeAccent,
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() => curr = index),
          //other params
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // TODO(self): show popup after the openning 3 seconds
    // Timer(Duration(seconds: 3), () {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Welcome!'),
    //         content: Text('This is a welcome message.'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // });
  }
}

class FabPie extends StatelessWidget {
  const FabPie({super.key});

  @override
  Widget build(BuildContext context) {
    return PieMenu(
      key: UniqueKey(),
      theme: PieTheme(
        regularPressShowsMenu: true,
        pointerDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
      actions: [
        PieAction(
          tooltip: const Text(''),
          onSelect: () => pickImage(context, ImageSource.camera),
          child: const Icon(Icons.camera), // Can be any widget
          buttonTheme: PieButtonTheme(
            // backgroundColor: Color(0xff373A36),
            backgroundColor: Colors.red,
            iconColor: Colors.white,
          ),
        ),
        PieAction(
          buttonTheme: PieButtonTheme(
            // backgroundColor: Color(0xff373A36),
            backgroundColor: Colors.red,
            iconColor: Colors.white,
          ),
          tooltip: const Text('file'),
          onSelect: () => pickImage(context, ImageSource.gallery),
          child: const Icon(Icons.file_open), // Can be any widget
        ),
      ],
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 30,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // child: FloatingActionButton(
      //   key: UniqueKey(),
      //   // backgroundColor: Color(0xff373A36),
      //   backgroundColor: Colors.red,
      //   onPressed: null,
      //   shape: CircleBorder(),
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final navigate = Navigator.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    // TODO: add the corp image function here, then goto
    // the image preview page
    final cp = CropImage();
    if (image != null) {
      final croppedImage = await cp.cropImage(image.path, CropStyle.rectangle);

      if (croppedImage != null) {
        navigate.push(
          MaterialPageRoute(
            builder: (context) =>
                ImagePreviewPage(imagePath: croppedImage.path),
          ),
        );
      }
    }
  }
}
