import 'package:flutter/material.dart';
import '../../../../app/resources/app_values.dart';
import '../../../../domain/entities/color_palette_model.dart';
import 'bookmark_palette_item.dart';

class BookmarksPalettesGrid extends StatelessWidget {
  final List<ColorPaletteModel> palettes;
  const BookmarksPalettesGrid({Key? key, required this.palettes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: AppValues.bookmarkPaletteAspectRatio,
            crossAxisCount: 2, crossAxisSpacing: AppValues.smallPadding,
            mainAxisSpacing: AppValues.pagePadding
        ),
        itemCount: palettes.length,
        itemBuilder: (context,index) => BookmarkPaletteItem(
            palette: palettes[index], key: Key(palettes[index].id))
    );
  }
}
