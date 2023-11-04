import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:flutter/material.dart';
import '../../../../app/resources/app_values.dart';
import '../../../../app/components/color_hex.dart';

class ColorPalette extends StatelessWidget {
  final ColorPaletteModel palette;
  const ColorPalette({Key? key, required this.palette}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.generatePaletteBorderRadius),
        child: Column(
          children: List.generate(
              palette.length,
              (index) => Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(AppValues.pagePadding),
                    color: palette.paletteColors[index].color,
                    child: ColorHex(hexCode: palette.paletteColors[index].hexCode),
                  )
              )
          ),
        ),
      ),
    );
  }
}
