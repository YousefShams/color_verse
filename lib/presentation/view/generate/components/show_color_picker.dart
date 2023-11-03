import 'package:flutter/material.dart';

import '../../../../app/resources/app_values.dart';
import 'color_picker_widget.dart';

Future showColorPicker(BuildContext context, Color pickedColor,
    Function(Color) onChanged) async {
  return await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius:
      BorderRadius.circular(AppValues.defaultBorderRadius)),
      enableDrag: false, showDragHandle: true,
      builder: (context) => DefaultColorPicker(pickedColor: pickedColor, onChanged: onChanged)
  );

}