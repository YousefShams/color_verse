import 'package:flutter/material.dart';

import '../../presentation/view/splash/splash_view.dart';
import '../constants/constants.dart';
import '../resources/app_page_transition.dart';
import '../resources/app_themes.dart';
import '../routes/app_routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: AppConsts.appTitle,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemes.getTheme(),
      onGenerateInitialRoutes: (_)=> [PageTransition(const SplashScreen())],
    );
  }
}
