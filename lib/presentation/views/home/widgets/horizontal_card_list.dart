// presentation/views/home/widgets/horizontal_card_list.dart
import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/big_text.dart';
import 'package:news_app/presentation/widgets/small_text.dart';

import '../../../../core/utils/dimension.dart';

class HorizontalCardList extends StatelessWidget {
  final String? title;
  final List<dynamic> items;

  const HorizontalCardList({
    this.title,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
        SizedBox(height: Dimension.height10(screenHeight)*2,),
        SizedBox(
          height: Dimension.featureItemCardHeight(screenHeight),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  right: index == items.length - 1 ? 16 : 8,
                ),
                child: SizedBox(
                    width: Dimension.featureItemCardWidth(screenWidth),
                    child: Column(
                      children: [
                        Container(
                          height: Dimension.featureItemImgHeight(screenHeight),
                          width: Dimension.featureItemCardWidth(screenWidth),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 16, right: 8, bottom: 16, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                  text:
                                      "Experience the Serenity of Japan's Traditional Countryside",
                                  size: 22),
                              SmallText(
                                text: "Technology",
                                size: 12,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
