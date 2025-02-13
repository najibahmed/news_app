// presentation/views/home/home_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/custom_sliver_app_bar.dart';
import 'widgets/horizontal_card_list.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              HorizontalCardList(
                title: 'Featured Items',
                items: List.generate(10, (index) => 'Item $index'),
              ),
              const SizedBox(height: 16),
              HorizontalCardList(
                title: 'Recommended',
                items: List.generate(10, (index) => 'Recommended $index'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
