import 'package:color_verse/app/components/app_title.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_palettes.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/home/components/color_palettes_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return Padding(
      padding: const EdgeInsets.fromLTRB(p,p,p,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle(big: true, color:AppColors.primaryColor,title: AppStrings.homeTitle),
          const SizedBox(height: AppValues.verticalSpaceBetweenWidgets),
          ColorPalettesList(colorPalettes: appPalettes)
        ],
      ),
    );
  }
}
