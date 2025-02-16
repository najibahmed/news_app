/// routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/views/news_details/details_page.dart';
import 'package:news_app/presentation/views/search/search_page.dart';
import '../data/dataSources/local/my_share_pref.dart';
import '../models/news_model.dart';
import '../presentation/onBoarding/on_boarding_page.dart';
import '../presentation/views/archive/archive_tab.dart';
import '../presentation/views/explore/explore_tab.dart';
import '../presentation/views/home/dashBoard_page.dart';
import '../presentation/views/home/home_tab.dart';
import '../presentation/views/profile/profile_tab.dart';

class AppRouter {
  static const String initial = "/initial";
  static const String searchView = "/search";
  static const String details = "/details";
  static const String onBoarding = "/on-boarding";


  static String getDetails(String id) => "$details$id";

  static GoRouter appRoutes=GoRouter(
      initialLocation:  onBoarding,
      routes: [
        GoRoute(
          path: initial,
          builder: (context, state) => const Dashboard(),
        ),
        GoRoute(
          path: onBoarding,
          builder: (context, state) => const OnBoardingPage(),
        ),
        GoRoute(
          path: searchView,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
            path: details,
            builder: (context, state) {
              final article = state.extra as NewsArticle;
              return DetailsPage(
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
