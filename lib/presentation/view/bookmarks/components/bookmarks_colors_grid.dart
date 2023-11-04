import 'package:flutter/material.dart';

import '../../../../app/resources/app_values.dart';
import '../../../../domain/entities/color_model.dart';
import 'bookmark_color_item.dart';

class BookmarksColorGrid extends StatelessWidget {
  final List<ColorModel> colors;
  const BookmarksColorGrid({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: AppValues.bookmarkColorAspectRatio,
            crossAxisCount: 2, crossAxisSpacing: AppValues.smallPadding,
            mainAxisSpacing: AppValues.pagePadding
        ),
        itemCount: colors.length,
        itemBuilder: (context,index) => BookmarkColorItem(
            colorModel: colors[index], key: Key(colors[index].id),)
    );
  }
}
