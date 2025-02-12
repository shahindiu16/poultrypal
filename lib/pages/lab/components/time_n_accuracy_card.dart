import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TimeAndAccuracyCard extends StatelessWidget {
  const TimeAndAccuracyCard({
    super.key,
    required this.value,
    required this.isTime,
  });

  final String value;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(15),
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
            Icon(
              CupertinoIcons.clock_fill,
              color: Colors.green,
            )
          else
            Icon(
              Icons.bar_chart,
              color: Colors.orange[800],
            ),
          Text(isTime ? i10?.time ?? "" : i10?.accuracy ?? "",
              style: TextStyle(
                color: isTime ? Colors.green : Colors.orange[800],
                fontWeight: FontWeight.bold,
              )),
          // Text("${((timeTook ?? 0) / 1000).toStringAsFixed(2)} sec",
          Text(value,
              style: TextStyle(
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
