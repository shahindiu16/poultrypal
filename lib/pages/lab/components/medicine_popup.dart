import 'package:flutter/material.dart';
import 'package:poultrypal/utils/utilts.dart';

import '../../../components/med_info.dart';

class MedicinePopup extends StatelessWidget {
  const MedicinePopup({required this.diseasesType, super.key});

  final ImagePrediction diseasesType;

  @override
  Widget build(BuildContext context) {
    final newcastMed = parseNewcastleMedInfo(newcastleMedInfo);

    final cocMed = parseNewcastleMedInfo(coccidiosisMedInfo);

    final salmonMed = parseNewcastleMedInfo(salmonellosisMedInfo);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
              '(Brand-name drugs are only applicable in Bangladesh. Please consult with a registered veterinarian before administering any drug.)',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
              textAlign: TextAlign.center,
            ),
            if (ImagePrediction.salmo == diseasesType)
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
            if (ImagePrediction.cocci == diseasesType)
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
            if (ImagePrediction.ncd == diseasesType)
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
          ],
        ),
      ),
    );
  }
}
