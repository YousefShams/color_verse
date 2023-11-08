import 'package:color_verse/app/components/loading_screen.dart';
import 'package:color_verse/app/components/page_title.dart';
import 'package:color_verse/app/di/di.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_colors_grid.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarks_palettes_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/bookmarks/cubit.dart';
import '../../../view_model/bookmarks/state.dart';

class BookmarksSeeAllPage extends StatelessWidget {
  final bool isPalette;
  const BookmarksSeeAllPage({Key? key, required this.isPalette,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (cubitContext) => getIt<BookmarksCubit>()..init(),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (cubitContext, state) {
          final cubit = BookmarksCubit.get(cubitContext);
          return (state is BookmarksLoadingState) ? const LoadingScreen() :
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(onPressed: () { Navigator.pop(context);},
                  icon: Icon(CupertinoIcons.back, color: Theme.of(context).textTheme.titleLarge?.color,)),),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppValues.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(title: isPalette ? AppStrings.yourPalettes : AppStrings.yourColors),
                  const SizedBox(height: AppValues.pagePadding),
                  Expanded(
                    child: Visibility(
                      visible: isPalette,
                      replacement: BookmarksColorGrid(colors: cubit.colors),
                      child: BookmarksPalettesGrid(palettes: cubit.palettes),
                    ),
                  ),
                  const SizedBox(height: AppValues.pagePadding),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
