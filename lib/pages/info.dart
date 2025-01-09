import 'package:flutter/material.dart';
import 'package:poultrypal/components/section.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              title: "Privacy Policy",
              items: [
                {
                  "title": "Introduction",
                  "content": "This is the introduction to our privacy policy."
                },
                {
                  "title": "Data Collection",
                  "content": "We collect user data to improve the experience."
                },
                {
                  "title": "Your Rights",
                  "content":
                      "You have the right to access your data at any time."
                },
              ],
            ),
            const SizedBox(height: 20),
            Section(
              title: "User Manual",
              items: [
                {
                  "title": "Getting Started",
                  "content": "Learn how to set up and use the app."
                },
                {
                  "title": "Features",
                  "content": "Discover all the features of the app."
                },
                {
                  "title": "Troubleshooting",
                  "content": "Find solutions to common problems."
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
