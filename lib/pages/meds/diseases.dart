import 'package:flutter/material.dart';
import 'package:poultrypal/l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:poultrypal/admob/admob_ids.dart';
import 'package:poultrypal/admob/widgest/banner_ads.dart';
import 'package:poultrypal/models/diseases_model.dart';
import 'package:poultrypal/pages/components/lang_change.dart';

class DiseasesPage extends StatelessWidget {
  const DiseasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    final diseases = diseasesData(i10!)
        .map((e) => DiseaseModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(i10.homeCardDiseasesTitle),
        actions: const [
          LangChangeBtn(),
        ],
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          final adID = index == 0
              ? AdMobAdIds.diseasesBannerAdUnitId1
              : index == 1
                  ? AdMobAdIds.diseasesBannerAdUnitId2
                  : AdMobAdIds.diseasesBannerAdUnitId3;
          // final adID = AdMobAdIds.testBannerAdUnitId;
          return Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    disease.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.blueAccent,
                        ),
                  ),
                  children: disease.sections.map((section) {
                    return ExpansionTile(
                      shape: Border.all(),
                      title: Text(
                        section.title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      children: section.content.map((content) {
                        if (content.points != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: content.points!
                                .map((point) => ListTile(title: Text(point)))
                                .toList(),
                          );
                        }
                        return ListTile(
                          title: Text(content.heading ?? ''),
                          subtitle: Text(content.text ?? ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),

              // NOTE: ADMOB
              BannerAds(
                adsize: AdSize.fullBanner,
                adUnitId: adID,
              ),
            ],
          );
        },
      ),
    );
  }
}
