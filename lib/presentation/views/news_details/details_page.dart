import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../models/news_model.dart';
import 'details_provider.dart';

class DetailsPage extends ConsumerWidget {
  final NewsArticle article;
  final String id;

  const DetailsPage({
    super.key,
    required this.id,
    required this.article
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogPostAsync = ref.watch(blogPostProvider(id));
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: screenHeight * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        article.urlToImage??article.url!,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * .3 - 20,
              child: Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      )),
                child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.grey,
                                      child: Icon(Icons.person,
                                          size: 16, color: Colors.white),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      article.author!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      DateFormat('MMM d, yyyy').format(DateTime.now()),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  article.content!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 20),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
          ),
          //
        ],
      ),
      bottomNavigationBar: Container(
            height: screenHeight*.1,
            padding: const EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ActionButton(
              icon: Icons.arrow_back,
              onPressed: () {
                context.pop();
              },
            ),
            const Spacer(),
            _ActionButton(
              icon: Icons.thumb_up_outlined,
              label: '1',
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            _ActionButton(
              icon: Icons.comment_outlined,
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            _ActionButton(
              icon: Icons.share_outlined,
              onPressed: () {},
            ),
          ],
        ),
          )
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback onPressed;

  const _ActionButton({
    Key? key,
    required this.icon,
    this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black),
            if (label != null) ...[
              const SizedBox(width: 4),
              Text(
                label!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
