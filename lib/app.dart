import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/components/lang_change.dart';
import 'package:poultrypal/pages/home/home.dart';
import 'package:poultrypal/pages/info/info.dart';
import 'package:poultrypal/pages/lab/lab_page.dart';

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
        floatingActionButton: PieMenu(
          theme: PieTheme(
            delayDuration: Duration.zero,
          ),
          actions: [
            PieAction(
              tooltip: const Text(''),
              onSelect: () => pickImage(context, ImageSource.camera),
              child: const Icon(Icons.camera), // Can be any widget
              buttonTheme: PieButtonTheme(
                backgroundColor: Color(0xff373A36),
                iconColor: Colors.white,
              ),
            ),
            PieAction(
              buttonTheme: PieButtonTheme(
                backgroundColor: Color(0xff373A36),
                iconColor: Colors.white,
              ),
              tooltip: const Text('file'),
              onSelect: () => pickImage(context, ImageSource.gallery),
              child: const Icon(Icons.file_open), // Can be any widget
            ),
          ],
          child: FloatingActionButton(
              backgroundColor: Color(0xff373A36),
              onPressed: null,
              shape: CircleBorder(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Color(0xff373A36),
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
    Timer(Duration(seconds: 3), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Welcome!'),
            content: Text('This is a welcome message.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewPage(imagePath: image.path),
        ),
      );
    }
  }
}
