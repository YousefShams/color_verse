import 'dart:math';

import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_assets.dart';
import 'package:color_verse/app/resources/app_page_transition.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_palettes_grid.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_see_all.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:flutter/material.dart';

import '../../../../app/components/page_title.dart';
import '../../../../app/resources/app_strings.dart';
import 'bookmarks_empty.dart';

class BookmarkedPalettes extends StatelessWidget {
  final List<ColorPaletteModel> allPalettes;
  const BookmarkedPalettes({Key? key, required this.allPalettes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const flex = 5;
    return Visibility(
      visible: allPalettes.isNotEmpty,
      replacement: const BookmarksEmpty(text:AppStrings.bookmarkedPalettesEmpty,
        asset: AppAssets.palettes, flex: flex,
      ),
      child: Expanded(
        flex: flex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const PageTitle(title: AppStrings.yourPalettes),
                const Spacer(),
                GestureDetector(
                  onTap: () { Navigator.push(context, PageTransition(
                      const BookmarksSeeAllPage(isPalette: true)
                  )).then((_) => BookmarksCubit.get(context).init()); },
                  child: Text(AppStrings.seeAll, style: context.textTheme.labelLarge)
                ),
              ],
            ),
            Expanded(
              child: BookmarksPalettesGrid(palettes: allPalettes.sublist(0,min(4, allPalettes.length))),
            )
          ],
        ),
      ),
    );
  }
}
