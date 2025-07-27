import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/admob/admob_ids.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/components/home_card.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/l10n/app_localizations.dart';
import 'package:poultrypal/pages/meds/diseases.dart';
import 'package:poultrypal/pages/meds/medcine.dart';

import '../../admob/widgest/my_banner_ads.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return ListView(
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
                      CupertinoPageRoute(builder: (_) => const DiseasesPage()));
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
        ),

        // Text("Testing banner Mine"),
        /// flutter
        MyBannerAdWidget(adUnitId: AdMobAdIds.homeScreenbannerAdUnitId,
          adSize: AdSize.mediumRectangle,
        ),

        // Text("Testing ENDS GPT"),
        //
        // /// gpt
        // MyCustomAdWidget2 (adUnitId: AdMobAdIds.reportBannerAdUnitID, adSize: adsize),
        // Text("Testing ENDS old"),
        /// OLD
        // BannerAds(
        //   adsize: adsize,
        //   adUnitId: AdMobAdIds.homeScreenbannerAdUnitId,
        // ),
      ],
    );
  }
}
