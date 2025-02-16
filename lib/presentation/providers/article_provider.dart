import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import '../../data/dataSources/remote/api_client.dart';
import '../../models/news_model.dart';



final articleRepo = Provider((ref) => ArticleRepository(apiClient: ApiClient()));

 categoryArticlesProvider(String category) => FutureProvider<List<NewsArticle>>((ref) async {
  final repository = ref.watch(articleRepo);
  return repository.fetchExploreCategory(category);
});