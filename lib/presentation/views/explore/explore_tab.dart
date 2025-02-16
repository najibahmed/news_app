import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/routes/app_router.dart';
import '../../../models/news_model.dart';
import '../../providers/article_provider.dart';
import '../../providers/theme_provider.dart';


class ExploreTab extends ConsumerWidget {

   ExploreTab({super.key});

  final List<String> _tabs = [
    'Business',
    'Travel',
    'Technology',
    'Science',
    'Arts',
    'Health'
  ];
  int _value = 0;


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var catNewsData = ref.read(categoryArticlesProvider("bangladesh"));

    final themeMode = ref.watch(themeModeProvider);
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          backgroundColor: themeMode==ThemeMode.light? Color(0xffE9EEFA): Color(0xff1A1A1A),
          elevation: 0,
          title:  Text(
            'Explore',
            style: TextStyle(
              color:themeMode==ThemeMode.light?Colors.black:Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon:  Icon(Icons.search, color:Theme.of(context).buttonTheme.colorScheme!.onSurfaceVariant),
              onPressed: () {
                context.push(AppRouter.searchView);
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (context, index) {
                    var tab = _tabs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ChoiceChip(
                        selectedColor:themeMode==ThemeMode.light? Color(0xffE9EEFA):Color(0xff1A1A1A),
                        backgroundColor: themeMode==ThemeMode.light?Colors.white :Colors.black,
                        labelStyle: TextStyle(color: themeMode==ThemeMode.light?Colors.black :Colors.white,),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        label: Text(tab),
                        selected: _value == index,
                        onSelected: (bool selected) {
                            _value = selected ? index : _value;
                            // var catNewsData = ref.watch(categoryArticlesProvider(tab.toLowerCase()));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                // if (!catNewsData.hasValue) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                // var article= catNewsData.value![index];
                return _ArticleCard2(
                  imageUrl: 'https://picsum.photos/400/200', // Placeholder image
                  title: 'Article Title for Technology ${index + 1}',
                  author: 'Author Name',
                  date: 'May 1, 2023',
                );

                //   _ArticleCard2(
                //       imageUrl: article.url?? article.urlToImage!,//'https://picsum.photos/400/200',
                //       // Placeholder image
                //       title: article.title!,
                //       author: article.author!,
                //       date: article.publishedAt!,
                // );
              },
            )
        )
      ],
    );
    // );
  }
}

class _ArticlesList extends ConsumerWidget {
  final List<NewsArticle> categoryNews;

  const _ArticlesList({required this.categoryNews});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Mock number of articles
        itemBuilder: (context, index) {
          final article = categoryNews[index];
          return _ArticleCard2(
            imageUrl: 'https://picsum.photos/400/200', // Placeholder image
            title: 'Article Title for Technology ${index + 1}',
            author: 'Author Name',
            date: 'May 1, 2023',
          );
            _ArticleCard2(
            imageUrl: 'https://picsum.photos/400/200', // Placeholder image
            title: article.title!,
            author: article.author!,
            date: article.publishedAt!,
          );
        });

    //       ListView.builder(
    //     padding: const EdgeInsets.all(16),
    //     itemCount: 10, // Mock number of articles
    //     itemBuilder: (context, index) {
    //       NewsArticle newsItem=newsList[index];
    //       return _ArticleCard2(
    //         imageUrl: 'https://picsum.photos/400/200', // Placeholder image
    //         title: newsItem.title!,
    //         author: newsItem.author!,
    //         date: newsItem.publishedAt!,
    //       );
    //     }
    // );
    //   },
    //   loading: () => const Center(child: CircularProgressIndicator()),
    //   error: (error, _) => Center(child: Text("Error: $error")),
    //   )
    //     ],
    //   );
  }
}

class _ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String date;

  const _ArticleCard({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      author,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleCard2 extends ConsumerWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String date;

  const _ArticleCard2({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Card(
      color: themeMode==ThemeMode.light? Colors.white:Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey,
                          child:
                              Icon(Icons.person, size: 16, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 120,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            author,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '•',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error_outline),
                imageUrl: imageUrl,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
