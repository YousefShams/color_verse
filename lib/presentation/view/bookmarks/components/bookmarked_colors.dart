import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_assets.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_colors_grid.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_empty.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_see_all.dart';
import 'package:flutter/material.dart';
import '../../../../app/components/page_title.dart';
import '../../../../app/resources/app_page_transition.dart';
import '../../../../app/resources/app_strings.dart';
import '../../../view_model/bookmarks/cubit.dart';

class BookmarkedColors extends StatelessWidget {
  final List<ColorModel> colors;
  final List<ColorModel> allColors;

  const BookmarkedColors({Key? key, required this.colors,
    required this.allColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const flex = 4;
    return Visibility(
      visible: colors.isNotEmpty,
      replacement: const BookmarksEmpty(text: AppStrings.bookmarkedColorsEmpty,
        asset: AppAssets.colorCards, flex: flex,
      ),
      child: Expanded(
        flex: flex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const PageTitle(title: AppStrings.yourColors),
                const Spacer(),
                GestureDetector(
                    onTap: () { Navigator.push(context, PageTransition(
                        BookmarksSeeAllPage(
                            title: AppStrings.yourColors,
                            child: BookmarksColorGrid(colors: allColors)
                        )
                    )).then((_) => BookmarksCubit.get(context).init());
                    },
                    child: Text(AppStrings.seeAll, style: context.textTheme.labelLarge)
                ),
              ],
            ),
            Expanded(
              child: BookmarksColorGrid(colors: colors),
            )
          ],
        ),
      ),
    );
  }
}
