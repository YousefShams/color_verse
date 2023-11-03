import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/components/delete_icon_button.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:flutter/material.dart';

import '../../../../app/functions/functions.dart';

class BookmarkPaletteItem extends StatefulWidget {
  final List<String> palette;
  const BookmarkPaletteItem({Key? key, required this.palette}) : super(key: key);

  @override
  State<BookmarkPaletteItem> createState() => _BookmarkPaletteItemState();
}

class _BookmarkPaletteItemState extends State<BookmarkPaletteItem> {
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !deleted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.colorPaletteRoute,
                    arguments: widget.palette);
              },
              child: ColorPaletteRow(hexColors: widget.palette)
            )
          ),
          const SizedBox(height: AppValues.smallPadding),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: AppValues.smallerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    AppFunctions.getColorNameFromHexCodes(widget.palette),
                    style: context.textTheme.labelSmall,
                    maxLines: 2, overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(width: AppValues.smallerPadding),
                DeleteIconButton(onPressed: () {
                  BookmarksCubit.get(context).deleteBookmarkedPalette(widget.palette);
                  setState(() { deleted = true; });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
