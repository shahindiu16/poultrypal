import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const Section({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => ExpandableItem(
            title: item["title"]!,
            content: item["content"]!,
          ),
        ),
      ],
    );
  }
}

class ExpandableItem extends StatelessWidget {
  final String title;
  final String content;

  const ExpandableItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
