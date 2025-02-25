import '../../core/constant/api_constants.dart';
import '../../data/dataSources/remote/api_client.dart';
import '../../models/news_model.dart';

class ArticleRepository{
  final ApiClient apiClient;
  ArticleRepository({required this.apiClient});


  Future<List<NewsArticle>> fetchExploreCategory(String category) async {
    List<NewsArticle> listNews=[];
    try {
      final response = await apiClient.get(ApiConstants.exploreCategory(category));
      if (response.statusCode == 200) {
            final data = response.data;
            final List articles = data['articles'];
            return articles.map((json) => NewsArticle.fromJson(json)).toList();
          } else {
            throw Exception('Failed to load news');
          }
    } catch (e) {
      print(e);
    }
    return listNews;
  }

}