// presentation/views/home/home_tab.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/dimension.dart';
import '../../providers/news_provider.dart';
import 'widgets/custom_sliver_app_bar.dart';
import 'widgets/horizontal_card_list.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    final newsAsyncValue = ref.watch(newsProvider);
    final techNewsAsyncValue = ref.watch(techNewsProvider);
    return  CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child:
            Column(
              children: [
                SizedBox(height: Dimension.height10(screenHeight)*2,),
                newsAsyncValue.when(
                  data: (newsList) {
                    return HorizontalCardList(
                      items: newsList,
                      seeMore: false,
                    );
                  },
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight*.3,),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                  error: (error, _) => Center(child: Text("Error: $error")),
                ),
                techNewsAsyncValue.when(
                  data: (newsList) {
                    return HorizontalCardList(title: "Just For You",
                        items: newsList,
                      seeMore: true,
                    );
                  },
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight*.3,),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                  error: (error, _) => Center(child: Text("Error: $error")),
                ),
                // HorizontalCardList(
                //   items: List.generate(10, (index) => 'Item $index'),
                // ),
                // const SizedBox(height: 16),
                // HorizontalCardList(
                //   title: 'Recommended',
                //   items: List.generate(10, (index) => 'Recommended $index'),
                // ),
              ],
            ),
          ),
        ],
    );
  }
}
