import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/components/default_animation.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPaletteWidget extends StatelessWidget {
  final ColorPaletteModel palette;
  final Function()? onPaletteSave;
  final bool isPaletteSaved;

  const ColorPaletteWidget({Key? key,
    required this.palette, required this.onPaletteSave,
    required this.isPaletteSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppValues.paletteSpacing),
      child: GestureDetector(
        onTap: (){ Navigator.pushNamed(context,AppRoutes.colorPaletteRoute,
            arguments: palette); },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.paletteBorderRadius),
                child: SizedBox(
                    height: AppValues.colorPaletteHeight,
                    child: ColorPaletteRow(colorsModels: palette.paletteColors))
            ),
            const SizedBox(height: AppValues.smallPadding),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppValues.smallPadding),
              child: DefaultAnimationWidget(
                offsetStartX: 100,
                offsetStartY: 0,
                opacityMs: AppValues.defaultAnimationTime,
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        AppFunctions.getColorNameFromHexCodes(palette.hexCodes),
                        style: context.textTheme.labelLarge,
                        maxLines: 1, overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(width: AppValues.pagePadding),
                    IconButton(
                        onPressed: onPaletteSave,
                        iconSize: AppValues.defaultIconSize,
                        style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                        icon: AnimatedScale(
                          curve: Curves.bounceOut,
                          duration: const Duration(milliseconds: AppValues.fastAnimationTime),
                          scale: isPaletteSaved ? 1.15 : 0.8 ,
                          child: Icon(
                            isPaletteSaved ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                            color: isPaletteSaved ? Colors.redAccent : AppColors.defaultIconColor
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
