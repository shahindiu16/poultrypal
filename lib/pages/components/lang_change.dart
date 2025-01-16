import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:poultrypal/main.dart';

class LangChangeBtn extends StatefulWidget {
  const LangChangeBtn({super.key});

  @override
  State<LangChangeBtn> createState() => _LangChangeBtnState();
}

class _LangChangeBtnState extends State<LangChangeBtn> {
  bool isUsa = true;

  String getLocalString() => isUsa ? "en" : "bn";

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final Locale locale = Localizations.localeOf(context);
    return IconButton(
      onPressed: () {
        setState(() {
          isUsa = !isUsa;
        });
        MyApp.setLocale(context, Locale(getLocalString()));
      },
      icon: AnimatedContainer(
        duration: Durations.medium2,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: isUsa
              ? Assets.img.banglaFlag.image()
              : Assets.img.usaFlag.image(),
        ),
      ),
    );
  }
}
