import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import '../../data/dataSources/remote/api_client.dart';
import '../../models/news_model.dart';



// final articleRepo = Provider((ref) => ArticleRepository(apiClient: ApiClient()));
//
//  categoryArticlesProvider(String category) => FutureProvider<List<NewsArticle>>((ref) async {
//   final repository = ref.watch(articleRepo);
//   return repository.fetchExploreCategory(category);
// });

class NewsNotifier extends StateNotifier<List<NewsArticle>> {
 final ArticleRepository repository;
 final String category;

 NewsNotifier(this.repository, this.category) : super([]) {
  // Fetch news automatically when the notifier is created
  Future.microtask(() => fetchCategoryArticles());
 }

 // Fetch articles for a given category
 Future<void> fetchCategoryArticles() async {
  try {
   final articles = await repository.fetchExploreCategory(category);
   state = articles; // Update state with fetched articles
  } catch (e) {
   state = []; // Reset state on error
   throw Exception("Failed to fetch articles: $e");
  }
 }
}

// Repository Provider
final articleRepo = Provider((ref) => ArticleRepository(apiClient: ApiClient()));

// NewsNotifier Provider with automatic initialization
final categoryArticlesProvider =
StateNotifierProvider.family<NewsNotifier, List<NewsArticle>, String>(
     (ref, category) => NewsNotifier(ref.read(articleRepo), category),
);
// StateProvider to manage selected tab index
final selectedTabProvider = StateProvider<int>((ref) => 0);