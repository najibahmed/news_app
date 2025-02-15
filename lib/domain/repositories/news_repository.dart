import 'package:news_app/core/constant/api_constants.dart';
import 'package:news_app/data/dataSources/remote/api_client.dart';
import '../../models/news_model.dart';

class NewsRepository {
  final ApiClient apiClient;
  NewsRepository({required this.apiClient});

  Future<List<NewsArticle>> fetchTopBusinessHeadlinesUs() async {
    final response = await apiClient.get(ApiConstants.TopBusinessHeadlinesUS);

    if (response.statusCode == 200) {
      final data = response.data;
      final List articles = data['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsArticle>> fetchTopTechHeadlinesRN() async {
    final response = await apiClient.get(ApiConstants.TopTechHeadlinesRN);

    if (response.statusCode == 200) {
      final data = response.data;
      final List articles = data['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}