import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poultrypal/utils/utilts.dart';

import 'medicine_popup.dart';

class DiagnosisReportCard extends StatelessWidget {
  const DiagnosisReportCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.content,
    super.key,
  });
  final String image, title, subtitle, content;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        // 'Generic Medicine',
        title,
      ),
      subtitle: Text(
        // "Sulfonamides or lonophores like Amprolium.",
        subtitle,
      ),
      backgroundColor: Colors.white,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10), child: Image.asset(image)),
      children: [
        if (content.isNotEmpty)
          Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Text(
                // "",
                content,
              )),
      ],
    );
  }
}

class DiagnosisReportCard2 extends StatelessWidget {
  const DiagnosisReportCard2({
    required this.image,
    required this.title,
    required this.imp, super.key,
  });
  final String image, title;
  final ImagePrediction imp;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // show a bottom sheet
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (_) => MedicinePopup(diseasesType: imp)));
      },
      // iconColor: Colors.transparent,
      title: Text(
        // 'Generic Medicine',
        title,
      ),
      trailing: const Icon(
        Icons.arrow_forward,
      ),
      // backgroundColor: Colors.white,
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffff6c52),
          // FF6C52
        ),
        child: Image.asset(image),
      ),
    );
  }
}
