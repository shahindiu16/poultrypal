import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poultrypal/models/diseases_model.dart';

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
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: EdgeInsets.all(10),
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
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
          );
        },
      ),
    );
  }
}
