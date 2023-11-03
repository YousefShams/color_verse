import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/components/color_palette_hex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPaletteItem extends StatelessWidget {
  final String hexCode;
  final int index;
  final bool isSaved;
  final Function onColorFavToggle;
  const ColorPaletteItem({Key? key, required this.hexCode,
    required this.index, required this.onColorFavToggle,
    required this.isSaved}) : super(key: key);

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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorPaletteHex(hexCode: hexCode),
                const SizedBox(width: AppValues.smallerPadding),
                GestureDetector(
                  onTap: () { onColorFavToggle(index); },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.colorPaletteHexBox,
                    child: Visibility(
                      visible: isSaved,
                      replacement: Icon(CupertinoIcons.heart, color: AppColors.defaultIconColor),
                      child: const Icon(CupertinoIcons.heart_fill, color: Colors.redAccent),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
