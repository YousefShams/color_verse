import 'package:color_verse/app/resources/app_assets.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class BrandingWidget extends StatelessWidget {
  const BrandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //const AppTitle(big: true),
        const SizedBox(height: AppValues.verticalSpaceBetweenWidgets),
        Image.asset(AppAssets.appLogo, width: 200,)
      ],
    );
  }
}
