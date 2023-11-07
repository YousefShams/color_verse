import 'package:color_verse/app/components/default_animation.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:flutter/material.dart';
import '../resources/app_values.dart';

class ColorPaletteRow extends StatelessWidget {
  final List<ColorModel> colorsModels;
  final double borderRadius;
  const ColorPaletteRow({Key? key, required this.colorsModels,
    this.borderRadius = AppValues.defaultBorderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(colorsModels.length, (i) =>
          Expanded(
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return DefaultAnimationWidget(
                  offsetStartX: AppFunctions.getPaletteColorAnimationOffset(
                      colorsModels.length, i, constraints.maxWidth),
                  opacityMs: AppValues.colorPaletteOpacityMs,
                  translationMs: AppValues.colorPaletteTranslationMs,
                  child: Container(
                    decoration: BoxDecoration(
                        color: colorsModels[i].color,
                        borderRadius: BorderRadius.only(
                          topLeft: (i==0) ? Radius.circular(borderRadius) : const Radius.circular(0),
                          bottomLeft: (i==0) ? Radius.circular(borderRadius) : const Radius.circular(0),
                          topRight: (i==colorsModels.length-1) ? Radius.circular(borderRadius) : const Radius.circular(0),
                          bottomRight: (i==colorsModels.length-1) ? Radius.circular(borderRadius) : const Radius.circular(0),
                        )
                    ),
                  ),
                );
              },
            ),
          )
      ),
    );
  }
}
