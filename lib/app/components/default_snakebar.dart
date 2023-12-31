import 'package:color_verse/app/application/application.dart';
import 'package:color_verse/app/constants/constants.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

void showDefaultSnackBar(String text) {
   final borderRadius = BorderRadius.circular(AppValues.defaultBorderRadius);
   ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
       SnackBar(
         duration: const Duration(milliseconds: AppConsts.toastDuration),
         behavior: SnackBarBehavior.floating,
         backgroundColor: Colors.green,
         shape: RoundedRectangleBorder(borderRadius: borderRadius),
         content: Container(
           decoration: BoxDecoration(borderRadius: borderRadius),
           child: Text(text, style: Theme.of(navigatorKey.currentState!.context).textTheme.titleMedium
               ?.copyWith(color: Colors.white), textAlign: TextAlign.center),
         )
       )
   );
}