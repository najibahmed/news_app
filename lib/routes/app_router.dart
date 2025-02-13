/// routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/views/news_details/details_page.dart';
import '../presentation/views/archive/archive_tab.dart';
import '../presentation/views/explore/explore_tab.dart';
import '../presentation/views/home/dashBoard_page.dart';
import '../presentation/views/home/home_tab.dart';
import '../presentation/views/profile/profile_tab.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (context, state) => DetailsPage(
          id: state.pathParameters['id']!,
        ),
      )
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
