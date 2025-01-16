import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:image_picker/image_picker.dart';
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

  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          LangChangeBtn(),
        ],
        backgroundColor: Color(0xfff8f9fa),
        leading: Assets.icon.image(),
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: curr == 0 ? HomePage() : InfoPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curr,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
        onTap: (int i) {
          setState(() {
            curr = i;
          });
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        pos: ExpandableFabPos.center,
        type: ExpandableFabType.fan,
        distance: 60,
        // pos: ExpandableFabPos.right,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.camera),
            onPressed: () => pickImage(context, ImageSource.camera),
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.file_open),
            onPressed: () => pickImage(context, ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}
