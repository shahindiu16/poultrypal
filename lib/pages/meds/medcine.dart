import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poultrypal/components/med_info.dart';

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
            "(Brand-name drug are only applicable in Bangladesh)",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
            textAlign: TextAlign.center,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Coccidiosis",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trade.company,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                )),
                            trade.dosage != null
                                ? Text(trade.dosage!)
                                : SizedBox.shrink(),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Newcastle",
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
                            : SizedBox.shrink(),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Salmonellosis",
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
                            : SizedBox.shrink(),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
