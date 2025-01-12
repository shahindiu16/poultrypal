import 'package:flutter/cupertino.dart';
import 'package:poultrypal/components/home_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/pages/diseases.dart';
import 'package:poultrypal/pages/medcine.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: HomeCard(
                img: Assets.img.hands13854025.path,
                title: i10!.homeCardDiseases,
                nextPage: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => DiseasesPage()));
                },
              ),
            ),
            Expanded(
              child: HomeCard(
                img: Assets.img.medical13854010.path,
                title: i10.homeCardMedicines,
                nextPage: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => MedicinesPage()));
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
