import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/dataSources/remote/api_client.dart';
import '../../domain/repositories/news_repository.dart';
import '../../models/news_model.dart';


final newsRepositoryProvider = Provider((ref) => NewsRepository(apiClient: ApiClient()));

final newsProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final repository = ref.read(newsRepositoryProvider);
  return repository.fetchTopBusinessHeadlinesUs();
});
final techNewsProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final repository = ref.read(newsRepositoryProvider);
  return repository.fetchTopTechHeadlinesRN();
});


