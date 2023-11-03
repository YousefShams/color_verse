import 'package:color_verse/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../resources/app_fonts.dart';
import '../resources/app_values.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({Key? key, this.title = AppConsts.appTitle,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppValues.pagePadding),
      child: Text(
        title, style: context.textTheme.titleLarge?.copyWith(
        fontWeight: AppFonts.lightFontWeight,
        fontSize: AppFonts.xlLargerFontSize
      )),
    );
  }
}
