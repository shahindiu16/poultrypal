import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.img,
    required this.title,
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
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.3,
            )
          ],
          borderRadius: BorderRadius.all(
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
            Text(title),
          ],
        ),
      ),
    );
  }
}
