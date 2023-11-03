import 'package:flutter/material.dart';

import '../functions/functions.dart';
import '../resources/app_values.dart';

class ColorPaletteRow extends StatelessWidget {
  final List<String> hexColors;
  final double borderRadius;
  const ColorPaletteRow({Key? key, required this.hexColors,
    this.borderRadius = AppValues.defaultBorderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(hexColors.length, (i) =>
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Color(AppFunctions.formatHexCodeToColorInput(hexColors[i])),
                  borderRadius: BorderRadius.only(
                    topLeft: (i==0) ? Radius.circular(borderRadius) : const Radius.circular(0),
                    bottomLeft: (i==0) ? Radius.circular(borderRadius) : const Radius.circular(0),
                    topRight: (i==hexColors.length-1) ? Radius.circular(borderRadius) : const Radius.circular(0),
                    bottomRight: (i==hexColors.length-1) ? Radius.circular(borderRadius) : const Radius.circular(0),
                  )
                ),
            ),
          )
      ),
    );
  }
}
