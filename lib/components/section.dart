import 'package:flutter/material.dart';
import 'package:poultrypal/pages/info/info.dart';

class Section extends StatelessWidget {

  const Section({
    required this.title, required this.items, super.key,
  });
  final String title;
  final List<SectionItem> items;

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
            title: item.title,
            content: item.contents,
          ),
        ),
      ],
    );
  }
}

class ExpandableItem extends StatelessWidget {

  const ExpandableItem({
    required this.title, required this.content, super.key,
  });
  final String title;
  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(10),
        title: Text(title),
        children: [
          for (var text in content)
            text.endsWith('.jpg')
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(text),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text),
                  )
        ],
      ),
    );
  }
}
