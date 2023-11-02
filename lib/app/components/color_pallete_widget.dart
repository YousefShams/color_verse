import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ColorPaletteWidget extends StatelessWidget {
  final List<String> hexColors;
  const ColorPaletteWidget({Key? key,
    required this.hexColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppValues.paletteSpacing),
      child: GestureDetector(
        onTap: (){ Navigator.pushNamed(context,AppRoutes.colorPaletteRoute,
            arguments: hexColors); },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.paletteBorderRadius),
                child: Row(
                  children: List.generate(hexColors.length, (i) =>
                      Expanded(
                        child: Container(
                            height: AppValues.colorPaletteHeight,
                            color: Color(AppFunctions.formatHexCodeToColorInput(hexColors[i]))
                        ),
                      )
                  ),
                )
            ),
            const SizedBox(height: AppValues.smallPadding),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppValues.smallPadding),
              child: Text(AppFunctions.getColorNameFromHexCodes(hexColors),
                style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.defaultIconColor?.withOpacity(0.85))),
            )
          ],
        ),
      ),
    );
  }
}
