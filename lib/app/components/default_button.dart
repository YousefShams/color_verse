import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:AppValues.buttonPadding),
      child: FilledButton(
        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor)),
        onPressed: () { onPressed(); },
        child: Padding(
          padding: const EdgeInsets.all(AppValues.buttonPadding),
          child: Text(text, style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFonts.mediumFontWeight,
              fontSize: AppFonts.biggerFontSize, color: Colors.white)
          ),
        )
      ),
    );
  }
}

class DefaultOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const DefaultOutlinedButton({Key? key, required this.onPressed,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:AppValues.buttonPadding),
      child: OutlinedButton(
          onPressed: () { onPressed(); },
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width:2,color: AppColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppValues.buttonPadding),
            child: Text(text, style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: AppFonts.mediumFontWeight,
                fontSize: AppFonts.biggerFontSize, color: AppColors.primaryColor)
            ),
          )
      ),
    );
  }
}
