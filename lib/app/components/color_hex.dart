import 'package:clipboard/clipboard.dart';
import 'package:color_verse/app/components/default_snakebar.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class ColorHex extends StatelessWidget {
  final String hexCode;
  const ColorHex({Key? key, required this.hexCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return Container(
      padding: const EdgeInsets.only(left : p , right: p*0.7),
      decoration: BoxDecoration(
        color: AppColors.colorPaletteHexBox,
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(hexCode,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.white)),
          const SizedBox(width: AppValues.smallerPadding),
          IconButton(
              style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
              onPressed: (){
                FlutterClipboard.copy(hexCode);
                showDefaultSnackBar(context, AppStrings.copied);
              },
              icon: const Icon(Icons.copy_rounded,color: Colors.white,))
        ],
      ),
    );
  }
}
