import 'package:color_verse/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../resources/app_fonts.dart';
import '../resources/app_values.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final bool big;
  final Color? color;
  const AppTitle({Key? key, this.title = AppConsts.appTitle,
    this.big = false, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppValues.pagePadding),
      child: Text(
        title, style: context.textTheme.titleLarge?.copyWith(
        fontSize: big ? AppFonts.xXLFontSize : null, color: color)),
    );
  }
}
