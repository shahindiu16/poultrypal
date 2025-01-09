import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/home.dart';
import 'package:poultrypal/pages/info.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: ExpandableFab(
        pos: ExpandableFabPos.center,
        type: ExpandableFabType.fan,
        distance: 60,
        // pos: ExpandableFabPos.right,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.camera),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.file_open),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class LangChangeBtn extends StatefulWidget {
  const LangChangeBtn({super.key});

  @override
  State<LangChangeBtn> createState() => _LangChangeBtnState();
}

class _LangChangeBtnState extends State<LangChangeBtn> {
  bool isUsa = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isUsa = !isUsa;
        });
      },
      icon: AnimatedContainer(
        duration: Durations.medium2,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: isUsa
              ? Assets.img.usaFlag.image()
              : Assets.img.banglaFlag.image(),
        ),
      ),
    );
  }
}
