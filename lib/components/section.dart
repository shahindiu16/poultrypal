import 'package:flutter/material.dart';
import 'package:poultrypal/pages/info.dart';

class Section extends StatelessWidget {
  final String title;
  final List<SectionItem> items;

  const Section({
    super.key,
    required this.title,
    required this.items,
  });

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
  final String title;
  final List<String> content;

  const ExpandableItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(10),
        title: Text(title),
        children: [
          for (var text in content)
            text.endsWith('.jpg')
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
