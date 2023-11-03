import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class BookmarkColorItem extends StatelessWidget {
  final String color;
  const BookmarkColorItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ClipRRect(
          borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
          child : Container(
            color: Color(AppFunctions.formatHexCodeToColorInput(color)),
          ),
        )),
        const SizedBox(height: AppValues.smallPadding),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: AppValues.smallerPadding),
          child: Text(
            color,
            style: context.textTheme.labelLarge,),
        )
      ],
    );
  }
}
