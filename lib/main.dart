import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/theme_provider.dart';
import 'package:news_app/routes/app_router.dart';

import 'core/theme/app_theme.dart';
import 'data/dataSources/local/my_share_pref.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  final isOnboardingDone = await MySharedPref.getOnBoardingStatus();
  runApp(ProviderScope(child: MyApp(isOnboardingDone: isOnboardingDone,)));
}

class MyApp extends ConsumerWidget {
  final bool isOnboardingDone;
  const MyApp({super.key, required this.isOnboardingDone});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Lask',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.appRoutes,
    );
  }
}
