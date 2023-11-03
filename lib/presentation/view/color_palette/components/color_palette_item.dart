import 'package:color_verse/app/components/close_icon_button.dart';
import 'package:color_verse/app/components/fav_button.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/components/color_hex.dart';
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
                  child: const CloseIconButton(),
                ),
                const Spacer()
              ],
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorHex(hexCode: hexCode),
                const SizedBox(width: AppValues.smallerPadding),
                FavouriteButton(onPressed: () { onColorFavToggle(index); },
                    isSaved: isSaved)
              ],
            ),
          ],
        ),
      )
    );
  }
}
