import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pop(context); },
      child: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallPadding),
        child: CircleAvatar(
          backgroundColor: AppColors.colorPaletteHexBox,
          child: const Icon(Icons.close_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
