import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/color_palette/components/color_palette_hex.dart';
import 'package:flutter/material.dart';

class ColorPaletteItem extends StatelessWidget {
  final String hexCode;
  final int index;
  const ColorPaletteItem({Key? key, required this.hexCode,
    required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(AppValues.pagePadding),
        color: Color(AppFunctions.formatHexCodeToColorInput(hexCode)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: index == 0,
                  child: GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: CircleAvatar(
                      backgroundColor: AppColors.colorPaletteHexBox,
                      child: const Icon(Icons.close_rounded, color: Colors.white),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
            const Spacer(),
            ColorPaletteHex(hexCode: hexCode),
          ],
        ),
      )
    );
  }
}
