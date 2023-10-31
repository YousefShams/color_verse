import 'package:color_verse/presentation/view/bookmarks/booksmarks_screen.dart';
import 'package:color_verse/presentation/view/generate/generate_screen.dart';
import 'package:color_verse/presentation/view/home/home_view.dart';
import 'package:color_verse/presentation/view/images/images_view.dart';
import 'package:color_verse/presentation/view/main/main_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/view/splash/splash_view.dart';
import '../resources/app_page_transition.dart';

class AppRoutes {

  static const splashRoute = "/splash";
  static const mainRoute = "/main";
  static const homeRoute = "/home";
  static const generateRoute = "/generate";
  static const imagesRoute = "/images";
  static const bookmarksRoute = "/bookmarks";



  static final screens = {
    splashRoute : const SplashScreen(),
    mainRoute : const MainScreen(),
    homeRoute : const HomeScreen(),
    imagesRoute : const ImageScreen(),
    generateRoute : const GenerateScreen(),
    bookmarksRoute : const BookmarksScreen(),
  };

  static Widget getScreenFromRoute(String? route) {
    return screens[route] ?? const Scaffold();
  }

  static Route onGenerateRoute (RouteSettings route) {
    return PageTransition(getScreenFromRoute(route.name), setting: route);
  }

  static final mainScreensRoutes = [homeRoute, generateRoute, imagesRoute, bookmarksRoute];
}