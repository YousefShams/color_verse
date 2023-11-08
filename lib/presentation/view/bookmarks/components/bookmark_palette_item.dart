import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/components/delete_icon_button.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:flutter/material.dart';
import '../../../../app/functions/functions.dart';
import '../../../../domain/entities/color_palette_model.dart';

class BookmarkPaletteItem extends StatefulWidget {
  final ColorPaletteModel palette;
  const BookmarkPaletteItem({Key? key, required this.palette}) : super(key: key);

  @override
  State<BookmarkPaletteItem> createState() => _BookmarkPaletteItemState();
}

class _BookmarkPaletteItemState extends State<BookmarkPaletteItem> {
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    final cubit = BookmarksCubit.get(context);
    return deleted
      ? const SizedBox.shrink()
      : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.colorPaletteRoute,
                      arguments: widget.palette).then((_) => cubit.init());
                },
                child: ColorPaletteRow(colorsModels: widget.palette.paletteColors)
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
                  AppFunctions.getColorNameFromHexCodes(widget.palette.hexCodes),
                  style: context.textTheme.labelSmall,
                  maxLines: 2, overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(width: AppValues.smallerPadding),
              DeleteIconButton(onPressed: () {
                cubit.deleteBookmarkedPalette(widget.palette);
                setState(() { deleted = true; });
              })
            ],
          ),
        )
      ],
    );
  }
}
