import 'package:flutter/material.dart';
import 'package:poultrypal/admob/admob_ids.dart';
import 'package:poultrypal/admob/widgest/my_banner_ads.dart';
import 'package:poultrypal/components/med_info.dart';
import 'package:poultrypal/l10n/app_localizations.dart';

class MedicinesPage extends StatelessWidget {
  MedicinesPage({super.key});

  final List<NewcastleMedInfo> newcastMed =
      parseNewcastleMedInfo(newcastleMedInfo);

  final List<NewcastleMedInfo> cocMed =
      parseNewcastleMedInfo(coccidiosisMedInfo);

  final List<NewcastleMedInfo> salmonMed =
      parseNewcastleMedInfo(salmonellosisMedInfo);
  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i10!.homeCardMedicines),
      ),
      body: ListView(
        children: [
          Text(
            '(Brand-name drugs are only applicable in Bangladesh. Please consult with a registered veterinarian before administering any drug.)',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
            textAlign: TextAlign.center,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Coccidiosis',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.blueAccent,
                    ),
              ),
              children: [
                for (var medInfo in cocMed)
                  ExpansionTile(
                    shape: Border.all(),
                    title: Text(medInfo.genericName),
                    children: medInfo.tradeNames.map((trade) {
                      return ListTile(
                        title: Text(
                          trade.tradeName.isNotEmpty
                              ? trade.tradeName
                              : 'No Trade Name',
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trade.company,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                )),
                            trade.dosage != null
                                ? Text(trade.dosage!)
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),

          // NOTE: ADMOB
          MyBannerAdWidget(
            // adsize: AdSize.banner,
            // adUnitId: AdMobAdIds.testBannerAdUnitId,
            adUnitId: AdMobAdIds.medicineBannerAdUnitId1,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Newcastle',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.blueAccent,
                    ),
              ),
              children: [
                for (var medInfo in newcastMed)
                  ExpansionTile(
                    shape: Border.all(),
                    title: Text(medInfo.genericName),
                    children: medInfo.tradeNames.map((trade) {
                      return ListTile(
                        title: Text(
                          trade.tradeName.isNotEmpty
                              ? trade.tradeName
                              : 'No Trade Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(trade.company),
                        trailing: trade.dosage != null
                            ? Text(trade.dosage!)
                            : const SizedBox.shrink(),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),

          // NOTE: ADMOB
          MyBannerAdWidget(
            // adsize: AdSize.fullBanner,
            // adUnitId: AdMobAdIds.testBannerAdUnitId,
            adUnitId: AdMobAdIds.medicineBannerAdUnitId2,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Salmonellosis',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.blueAccent,
                    ),
              ),
              children: [
                for (var medInfo in salmonMed)
                  ExpansionTile(
                    shape: Border.all(),
                    title: Text(medInfo.genericName),
                    children: medInfo.tradeNames.map((trade) {
                      return ListTile(
                        title: Text(
                          trade.tradeName.isNotEmpty
                              ? trade.tradeName
                              : 'No Trade Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(trade.company),
                        trailing: trade.dosage != null
                            ? Text(trade.dosage!)
                            : const SizedBox.shrink(),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),

          // NOTE: ADMOB
          MyBannerAdWidget(
            // adsize: AdSize.fullBanner,
            // adUnitId: AdMobAdIds.testBannerAdUnitId,
            adUnitId: AdMobAdIds.medicineBannerAdUnitId3,
          ),
        ],
      ),
    );
  }
}
