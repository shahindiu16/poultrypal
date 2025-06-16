import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:poultrypal/l10n/app_localizations.dart';

class TimeAndAccuracyCard extends StatelessWidget {
  const TimeAndAccuracyCard({
    required this.value, required this.isTime, super.key,
  });

  final String value;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isTime ? Colors.green : Colors.orange[800]!,
        ),
        color: isTime ? Colors.lightGreenAccent[100] : Colors.orange[200],
      ),
      child: Column(
        children: [
          if (isTime)
            const Icon(
              CupertinoIcons.clock_fill,
              color: Colors.green,
            )
          else
            Icon(
              Icons.bar_chart,
              color: Colors.orange[800],
            ),
          Text(isTime ? i10?.time ?? '' : i10?.accuracy ?? '',
              style: TextStyle(
                color: isTime ? Colors.green : Colors.orange[800],
                fontWeight: FontWeight.bold,
              )),
          // Text("${((timeTook ?? 0) / 1000).toStringAsFixed(2)} sec",
          Text(value,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
