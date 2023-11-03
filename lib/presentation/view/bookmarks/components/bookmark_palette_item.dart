import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../app/functions/functions.dart';

class BookmarkPaletteItem extends StatelessWidget {
  final List<String> palette;
  const BookmarkPaletteItem({Key? key, required this.palette}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () { Navigator.pushNamed(context, AppRoutes.colorPaletteRoute, arguments: palette); },
            child: ColorPaletteRow(hexColors: palette)
          )
        ),
        const SizedBox(height: AppValues.smallPadding),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: AppValues.smallerPadding),
          child: Text(
            AppFunctions.getColorNameFromHexCodes(palette),
            style: context.textTheme.labelSmall,
            maxLines: 2, overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }
}
