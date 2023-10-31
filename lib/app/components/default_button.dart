import 'package:color_verse/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../resources/app_fonts.dart';
import '../resources/app_values.dart';


class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const DefaultButton({Key? key, required this.onPressed,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValues.buttonWidth,
      height: AppValues.buttonHeight,
      margin: const EdgeInsets.only(bottom: AppValues.pagePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        // boxShadow: [BoxShadow(color: AppColors.primaryColorDarker!.withOpacity(0.3),
        // offset: const Offset(5, 9), spreadRadius: 0)]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:AppValues.buttonPadding),
        child: FilledButton(
          onPressed: () { onPressed(); },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppValues.buttonPadding),
            child: Text(text, style: context.textTheme.bodyMedium?.copyWith(
              fontSize: AppFonts.biggerFontSize)
            ),
          )
        ),
      ),
    );
  }
}
