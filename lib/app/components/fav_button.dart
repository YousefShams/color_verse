import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class FavouriteButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isSaved;
  const FavouriteButton({Key? key, required this.onPressed,
    required this.isSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.colorPaletteHexBox,
        child: Visibility(
          visible: isSaved,
          replacement: Icon(CupertinoIcons.heart, color: AppColors.defaultIconColor),
          child: const Icon(CupertinoIcons.heart_fill, color: Colors.redAccent),
        ),
      ),
    );
  }
}
