import 'package:flutter/material.dart';
import 'package:poultrypal/components/home_card.dart';
import 'package:poultrypal/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: HomeCard(
                img: Assets.img.hands13854025.path,
                title: 'Diseases',
              ),
            ),
            Expanded(
              child: HomeCard(
                img: Assets.img.medical13854010.path,
                title: 'Medicines',
              ),
            )
          ],
        )
      ],
    );
  }
}
