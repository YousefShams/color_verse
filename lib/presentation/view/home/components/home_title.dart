import 'package:color_verse/app/components/default_animation.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../app/resources/app_fonts.dart';
import '../../../../app/resources/app_strings.dart';
import '../../../../app/resources/app_values.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAnimationWidget(
      offsetStartY: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppValues.pagePadding),
        child: Text(
            AppStrings.homeTitle, style: context.textTheme.titleLarge?.copyWith(
          fontSize: AppFonts.xXLFontSize, color: AppColors.primaryColor,
        )),
      ),
    );
  }
}
