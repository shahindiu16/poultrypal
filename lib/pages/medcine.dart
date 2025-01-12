import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicinesPage extends StatelessWidget {
  const MedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i10!.homeCardMedicines),
      ),
    );
  }
}
