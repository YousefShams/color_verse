import 'package:color_verse/app/constants/constants.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_assets.dart';
import 'package:color_verse/app/resources/app_fonts.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';


class BrandingWidget extends StatelessWidget {
  const BrandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppAssets.appLogo, width: AppValues.brandingWidth),
        const SizedBox(height: AppValues.smallPadding),
        Container(height: 1.5, width: AppValues.brandingWidth,
            color: Colors.grey.withOpacity(0.5)),
        const SizedBox(height: AppValues.smallPadding),
        Text(AppConsts.appTitle, style: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFonts.xXLFontSize
        ))
      ],
    );
  }
}
