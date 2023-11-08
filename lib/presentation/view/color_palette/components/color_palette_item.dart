import 'package:color_verse/app/components/close_icon_button.dart';
import 'package:color_verse/app/components/fav_button.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/components/color_hex.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPaletteItem extends StatelessWidget {
  final ColorModel colorModel;
  final int index;
  final bool isSaved;
  final Function onColorFavToggle;
  const ColorPaletteItem({Key? key, required this.colorModel,
    required this.index, required this.onColorFavToggle,
    required this.isSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(AppValues.pagePadding),
        color: colorModel.color,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Visibility(
                  visible: index == 0,
                  child: const CloseIconButton(),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorHex(hexCode: colorModel.hexCode),
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
