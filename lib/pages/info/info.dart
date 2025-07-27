import 'package:flutter/material.dart';
import 'package:poultrypal/admob/admob_ids.dart';
import 'package:poultrypal/admob/widgest/my_banner_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/components/section.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/l10n/app_localizations.dart';
import 'package:poultrypal/pages/info/about_us_page.dart';

class SectionItem {
  const SectionItem({required this.title, required this.contents});
  final String title;
  final List<String> contents;
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  List<SectionItem> privacyPolicySection(AppLocalizations i10) => <SectionItem>[
        SectionItem(title: i10.infoPageSection1General, contents: [
          i10.infoPageSection1General1,
          i10.infoPageSection1General2,
        ]),
        SectionItem(title: i10.infoPageSection1SECU, contents: [
          i10.infoPageSection1SECU1,
          i10.infoPageSection1SECU2,
        ]),
        SectionItem(title: i10.infoPageSection1SRU, contents: [
          i10.infoPageSection1SRU1,
          i10.infoPageSection1SRU2,
          i10.infoPageSection1SRU3,
        ]),
        SectionItem(title: i10.infoPageSection1OU, contents: [
          i10.infoPageSection1OU1,
          i10.infoPageSection1OU2,
          i10.infoPageSection1OU3,
          i10.infoPageSection1OU4,
        ]),
        SectionItem(title: i10.infoPageSection1OPPW, contents: [
          i10.infoPageSection1OPPW1,
          i10.infoPageSection1OPPW2,
          i10.infoPageSection1OPPW3,
        ]),
        SectionItem(title: i10.infoPageSection1PRGRR, contents: [
          i10.infoPageSection1PRGRR1,
          i10.infoPageSection1PRGRR2,
          i10.infoPageSection1PRGRR3,
        ]),
        SectionItem(title: i10.infoPageSection1IT, contents: [
          i10.infoPageSection1IT1,
          i10.infoPageSection1IT2,
        ]),
        SectionItem(title: i10.infoPageSection1LLL, contents: [
          i10.infoPageSection1LLL1,
          i10.infoPageSection1LLL2,
          i10.infoPageSection1LLL3,
          i10.infoPageSection1LLL4,
          i10.infoPageSection1LLL5,
          i10.infoPageSection1LLL6,
          i10.infoPageSection1LLL7,
          i10.infoPageSection1LLL8,
        ]),
        SectionItem(title: i10.infoPageSection1DP, contents: [
          i10.infoPageSection1DP1,
          i10.infoPageSection1DP2,
        ]),
        SectionItem(title: i10.infoPageSection1TT, contents: [
          i10.infoPageSection1TT1,
          i10.infoPageSection1TT2,
        ]),
        SectionItem(title: i10.infoPageSection1FC, contents: [
          i10.infoPageSection1FC1,
          i10.infoPageSection1FC2,
          i10.infoPageSection1FC3,
          i10.infoPageSection1FC4,
        ]),
        SectionItem(title: i10.infoPageSection1AL, contents: [
          i10.infoPageSection1AL1,
          i10.infoPageSection1AL2,
        ]),
      ];

  List<SectionItem> userManualSection(AppLocalizations i10) => <SectionItem>[
        SectionItem(title: i10.infoPageSection2heading1, contents: [
          i10.infoPageSection2content1,
          Assets.userManual.homeScreen.path
        ]),
        SectionItem(
            title: i10.infoPageSection2heading2,
            contents: [i10.infoPageSection2content2]),
        // SectionItem(
        //     title: i10.infoPageSection2heading2,
        //     contents: [i10.infoPageSection2content2]),
        SectionItem(
            title: i10.infoPageSection2heading3,
            contents: [i10.infoPageSection2content3]),
        SectionItem(title: i10.infoPageSection2heading4, contents: [
          i10.infoPageSection2content4,
          Assets.userManual.redButton.path
        ]),
        SectionItem(title: i10.infoPageSection2heading5, contents: [
          i10.infoPageSection2content5,
          Assets.userManual.inferanceScreen.path
        ]),
        SectionItem(title: i10.infoPageSection2heading6, contents: [
          i10.infoPageSection2content6,
          Assets.userManual.takePic.path
        ]),
        SectionItem(title: i10.infoPageSection2heading7, contents: [
          i10.infoPageSection2content7,
          Assets.userManual.infoScreen.path
        ]),
      ];

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Section(
              title: i10?.infoPageSection1 ?? '',
              items: privacyPolicySection(i10!),
            ),
          ),
          Center(
            child: MyBannerAdWidget(
              // adUnitId: AdMobAdIds.testBannerAdUnitId,
              adUnitId: AdMobAdIds.infoBannerAdUnitId1,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Section(
              title: i10.infoPageSection2,
              items: userManualSection(i10),
            ),
          ),
          Center(
            child: MyBannerAdWidget(
              // adSize: AdSize.fullBanner,
              // adUnitId: AdMobAdIds.testBannerAdUnitId,
              adUnitId: AdMobAdIds.infoBannerAdUnitId2,
            ),
          ),

          const SizedBox(height: 20,),
          ElevatedButton(
            // full width
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
              child: const Text('About Us')),
          const SizedBox(height: 35,),
        ],
      ),
    );
  }
}
