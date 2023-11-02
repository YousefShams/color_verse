import 'package:color_verse/app/components/default_button.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class GenerateBottomButtons extends StatelessWidget {
  final Function onGenerate;
  final Function onSave;
  final bool isPaletteGenerated;
  const GenerateBottomButtons({Key? key, required this.onGenerate,
    required this.onSave, required this.isPaletteGenerated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isPaletteGenerated,
          child: Expanded(
            child: DefaultOutlinedButton(onPressed: onSave, text: AppStrings.save),
          ),
        ),
        Visibility(
            visible: isPaletteGenerated,
            child: const SizedBox(width: AppValues.pagePadding)),
        Expanded(child: DefaultButton(onPressed: onGenerate, text: AppStrings.generate)),
      ],
    );
  }
}
