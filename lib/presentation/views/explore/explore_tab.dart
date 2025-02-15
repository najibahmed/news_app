import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/views/home/widgets/horizontal_card_list.dart';

import '../../../models/news_model.dart';
import '../../providers/article_provider.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'Travel',
    'Technology',
    'Business',
    'Science',
    'Arts',
    'Health'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        elevation: 0,
        title: const Text(
          'Explore',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        // bottom: TabBar(
        //   controller: _tabController,
        //   isScrollable: true,
        //   labelColor: Colors.black,
        //   unselectedLabelColor: Colors.grey,
        //   indicatorColor: Colors.black,
        //   tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        // ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonsTabBar(
                  width: 120,
                  height: 32,
                  buttonMargin: EdgeInsets.symmetric(horizontal: 24),
                  contentCenter: true,
                  radius: 56,
                  physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  backgroundColor: Colors.blueGrey,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  tabs:_tabs.map((tab) => Tab(text: tab)).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  // controller: _tabController,
                  children:[
                    _ArticlesList(category: _tabs[0]),
                    _ArticlesList(category: _tabs[1]),
                    _ArticlesList(category: _tabs[2]),
                    _ArticlesList(category: _tabs[3]),
                    _ArticlesList(category: _tabs[4]),
                    _ArticlesList(category: _tabs[5]),
                  ] //_tabs.map((tab) => _ArticlesList(category: tab)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticlesList extends ConsumerWidget {
  final String category;

  const _ArticlesList({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exploreCategory = ref.watch(categoryArticlesProvider(category.toLowerCase()));
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Mock number of articles
      itemBuilder: (context, index) => _ArticleCard2(
        imageUrl: 'https://picsum.photos/400/200', // Placeholder image
        title: 'Article Title for $category ${index + 1}',
        author: 'Author Name',
        date: 'May 1, 2023',
      ),
    );

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

class _ArticleCard2 extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
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
                        child: Icon(Icons.person, size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        author,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
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
            borderRadius: const BorderRadius.all(Radius.circular(8),),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              imageUrl: imageUrl,
              height: 80,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}