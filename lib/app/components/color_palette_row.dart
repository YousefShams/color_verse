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
          )
      ),
    );
  }
}
