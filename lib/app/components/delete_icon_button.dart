import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class DeleteIconButton extends StatelessWidget {
  final Function()? onPressed;
  const DeleteIconButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        icon: Icon(Icons.delete_outline, color: AppColors.defaultIconColor,));
  }
}
