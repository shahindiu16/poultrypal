import 'package:flutter/material.dart';

class DiagnosisReportCard extends StatelessWidget {
  const DiagnosisReportCard({
    required this.image, required this.title, required this.subtitle, required this.content, super.key,
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
