import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';


class AppThemes {

  static ThemeData getTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldLightBackground,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        splashColor: AppColors.splashColor,
        fontFamily: AppFonts.fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldLightBackground,
          elevation: 3,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          titleLarge: AppFonts.getBoldStyle(color: Colors.grey[600]!),
          titleMedium: AppFonts.getMediumStyle(size: AppFonts.mediumFontSize, color: Colors.grey[600]!),
          bodyMedium: AppFonts.getRegularStyle(size: AppFonts.smallFontSize, color: Colors.grey[600]!),
          bodyLarge: AppFonts.getRegularStyle(size: AppFonts.mediumFontSize, color: Colors.grey[600]!),
          bodySmall: AppFonts.getRegularStyle(color: Colors.grey[600]!, size: AppFonts.tinyFontSize),
          labelSmall: AppFonts.getRegularStyle(size: AppFonts.smallestFontSize, color: Colors.grey[600]!),
          labelMedium: AppFonts.getRegularStyle(size: AppFonts.tinyFontSize, color: Colors.grey[600]!),
          labelLarge: AppFonts.getRegularStyle(size: AppFonts.smallerFontSize, color: Colors.grey[600]!),
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.blueGrey[300]?.withOpacity(0.9),
            contentPadding: const EdgeInsets.all(5),
            hintStyle: AppFonts.getRegularStyle(color: Colors.blueGrey[900]!),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
            prefixIconColor: Colors.blueGrey[900]!
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.scaffoldDarkBackground,
            selectedItemColor: AppColors.primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 20,
            unselectedItemColor: Colors.blueGrey[300]!
        ),
      useMaterial3: true
    );
  }


}