import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogPost {
  final String id;
  final String title;
  final String content;
  final String author;
  final DateTime date;
  final String imageUrl;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.imageUrl,
  });
}

final blogPostProvider = FutureProvider.family<BlogPost, String>((ref, id) async {
  // Simulate API call
  await Future.delayed(const Duration(seconds: 1));
  return BlogPost(
    id: id,
    title: 'See How the Forest is Helping Our World',
    content: 'Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet\'s ecosystems...',
    author: 'Holly Nelson',
    date: DateTime(2023, 4, 12),
    imageUrl: 'assets/forest.jpg', // Replace with your image
  );
});