// presentation/views/home/widgets/horizontal_card_list.dart
import 'package:flutter/material.dart';

class HorizontalCardList extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  const HorizontalCardList({
    required this.title,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  right: index == items.length - 1 ? 16 : 8,
                ),
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(8),
                  child: // Your card content
                  Container(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
