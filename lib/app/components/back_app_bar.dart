import 'package:color_verse/app/extensions/extensions.dart';
import 'package:flutter/material.dart';

AppBar getBackAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () { Navigator.pop(context); },
      icon: Icon(Icons.arrow_back_ios_new_rounded,
      color: context.textTheme.bodyMedium?.color,)
    )
  );
}