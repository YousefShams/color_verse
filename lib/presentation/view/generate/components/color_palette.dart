import 'package:flutter/material.dart';

import '../../../../app/functions/functions.dart';
import '../../../../app/resources/app_values.dart';
import '../../color_palette/components/color_palette_hex.dart';

class ColorPalette extends StatelessWidget {
  final List<String> palette;
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
                    color: Color(AppFunctions.formatHexCodeToColorInput(palette[index])),
                    child: ColorPaletteHex(hexCode: palette[index]),
                  )
              )
          ),
        ),
      ),
    );
  }
}
