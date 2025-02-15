/// routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/views/news_details/details_page.dart';
import '../models/news_model.dart';
import '../presentation/views/archive/archive_tab.dart';
import '../presentation/views/explore/explore_tab.dart';
import '../presentation/views/home/dashBoard_page.dart';
import '../presentation/views/home/home_tab.dart';
import '../presentation/views/profile/profile_tab.dart';

class AppRouter {
  static const String initial = "/";
  static const String details = "/details/:";

  static String getDetails(String id) => "$details$id";

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
          path: '/details/:id',
          builder: (context, state) {
            final article = state.extra as NewsArticle;
            return DetailsPage(
              id: state.pathParameters['id']!,
              article: article,
            );
          })
      // GoRoute(
      //   path: '/search',
      //   builder: (context, state) => const SearchPage(),
      // ),
      // GoRoute(
      //   path: '/search-results',
      //   builder: (context, state) => SearchResultsPage(
      //     query: state.uri.queryParameters['q']!,
      //   ),
      // ),
    ],
  );
}
