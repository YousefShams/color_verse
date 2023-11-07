import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/components/default_animation.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/functions/functions.dart';


class ImagePalette extends StatelessWidget {
  final ColorPaletteModel? palette;
  const ImagePalette({Key? key, required this.palette}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (palette==null) ? const SizedBox.shrink() :
    GestureDetector(
      onTap: () { Navigator.pushNamed(context, AppRoutes.colorPaletteRoute,
          arguments: palette); },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppValues.defaultBorderRadius),
              bottomRight: Radius.circular(AppValues.defaultBorderRadius),
            ),
            child: SizedBox(
              width: double.maxFinite,
              height: AppValues.colorPaletteHeight,
              child: ColorPaletteRow(
                colorsModels: palette!.paletteColors,
                borderRadius: 0
              )
            ),
          ),
          DefaultAnimationWidget(
            offsetStartY: AppValues.verticalSpaceBetweenWidgets,
            child: Padding(
              padding: const EdgeInsets.only(top: AppValues.pagePadding, left: AppValues.smallPadding),
              child: Text(
                AppFunctions.getColorNameFromHexCodes(palette!.hexCodes,
                    number: palette!.hexCodes.length),
                style: context.textTheme.bodyMedium,
                maxLines: 2, overflow: TextOverflow.clip,
              ),
            ),
          )
        ],
      ),
    );
  }
}
