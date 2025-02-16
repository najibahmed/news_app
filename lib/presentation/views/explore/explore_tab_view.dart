import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/models/news_model.dart';

import '../../../routes/app_router.dart';
import '../../providers/article_provider.dart';
import '../../providers/theme_provider.dart';


class ExploreTabs extends ConsumerStatefulWidget {
   ExploreTabs({super.key});

  @override
  ConsumerState<ExploreTabs> createState() => _ExploreTabState();
}
final List<String> _tabs = [
  'Business',
  'Travel',
  'Technology',
  'Science',
  'Arts',
  'Health'
];


class _ExploreTabState extends ConsumerState<ExploreTabs> {

  @override
  Widget build(BuildContext context) {
    var newsList = ref.watch(categoryArticlesProvider("travel"));
    final selectedIndex = ref.watch(selectedTabProvider);
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
                        selected: selectedIndex == index,
                        onSelected: (bool selected) {
                          if (selected) {
                            ref.read(selectedTabProvider.notifier).state = index;
                            ref.read(categoryArticlesProvider(tab.toLowerCase()).notifier).fetchCategoryArticles();
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        newsList.isEmpty
            ? SliverToBoxAdapter(
          child: const Center(child: CircularProgressIndicator()),)
            : SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: newsList.length, (context, index) {
                // return _ArticleCard2(
                //   imageUrl: 'https://picsum.photos/400/200', // Placeholder image
                //   title: 'Article Title for Technology ${index + 1}',
                //   author: 'Author Name',
                //   date: 'May 1, 2023',
                // );
                  final NewsArticle article= newsList[index];
                  if(index==0){
                    return _ArticleCard(
                        imageUrl: article.urlToImage!,
                        title: article.title!,
                        author: article.author!,
                        date: article.publishedAt!);
                  }
                return  _ArticleCard2(
                      imageUrl: article.urlToImage!,//'https://picsum.photos/400/200',
                      // Placeholder image
                      title: article.title!,
                      author: article.author!,
                      date: article.publishedAt!,
                );
              },
            )
        )
      ],
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
                      width: 220,
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
                          width: 80,
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
                        SizedBox(
                          width:70,
                          child: Text(
                          overflow:TextOverflow.ellipsis,
                            date,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
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
class _ArticleCard extends ConsumerWidget {
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
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode= ref.watch(themeModeProvider);
    return Card(
      color: themeMode==ThemeMode.light? Colors.white:Colors.black,
      margin: const EdgeInsets.only(bottom: 8,left: 8,right: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error_outline),
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