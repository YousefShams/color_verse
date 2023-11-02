import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DefaultColorPicker extends StatelessWidget {
  final Color pickedColor;
  final Function(Color) onChanged;

  const DefaultColorPicker({Key? key, required this.pickedColor,
    required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
        child: ColorPicker(
          pickerColor: pickedColor,
          pickerAreaHeightPercent: 0.5,
          enableAlpha: false,
          labelTypes: const [],
          onColorChanged: onChanged
        )
      )
    );
  }
}
