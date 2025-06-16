import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.img, required this.title, super.key,
    this.nextPage,
  });
  final String img, title;
  final void Function()? nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (nextPage != null) {
          nextPage!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.3,
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 2,
              child: Image.asset(
                img,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
