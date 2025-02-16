// presentation/views/home/widgets/horizontal_card_list.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/widgets/big_text.dart';
import 'package:news_app/presentation/widgets/small_text.dart';
import 'package:news_app/routes/app_router.dart';

import '../../../../core/utils/dimension.dart';
import '../../../../models/news_model.dart';
import '../../../providers/theme_provider.dart';

class HorizontalCardList extends ConsumerWidget {
  final String? title;
  final bool seeMore;
  final List<NewsArticle> items;

  const HorizontalCardList({
    this.title,
    required this.seeMore,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeMode = ref.watch(themeModeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            !seeMore
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Colors.blue),
                    ))
          ],
        ),
        SizedBox(
          height: Dimension.featureItemCardHeight(screenHeight),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              NewsArticle item = items[index];
              return GestureDetector(
                onTap: () => context.push(AppRouter.details, extra: item),
                child: Card(
                  color: themeMode == ThemeMode.light
                      ? Colors.white
                      : Colors.black,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                    right: index == items.length - 1 ? 16 : 8,
                  ),
                  child: SizedBox(
                      width: Dimension.featureItemCardWidth(screenWidth),
                      child: Column(
                        children: [
                          Container(
                            height:
                                Dimension.featureItemImgHeight(screenHeight),
                            width: Dimension.featureItemCardWidth(screenWidth),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Hero(
                                tag: item.title!,
                                child: CachedNetworkImage(
                                  imageUrl: item.urlToImage ?? item.url!,
                                  placeholder: (context, url) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                  errorWidget: (context, url, error) {
                                    print("Image error: $error");
                                    return const Icon(Icons.error);
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 8, right: 8, bottom: 8, left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: item.title!,
                                  //"Experience the Serenity of Japan's Traditional Countryside",
                                  size: 22,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                                SmallText(
                                    text: seeMore
                                        ? "Technology"
                                        : "BusinessHeadlines",
                                    size: 12,
                                    color: Theme.of(context).hintColor)
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
