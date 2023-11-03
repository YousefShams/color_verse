import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/data/apis/local/local_api.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarked_colors.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmarked_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/components/loading_screen.dart';
import '../../../app/resources/app_values.dart';
import '../../view_model/bookmarks/cubit.dart';
import '../../view_model/bookmarks/state.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return BlocProvider(
      create: (cubitContext) => BookmarksCubit(const LocalApi())..init(),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (cubitContext, state) {
          final cubit = BookmarksCubit.get(cubitContext);
          if (state is BookmarksLoadingState) { return const LoadingScreen(); }
          else {
            return RefreshIndicator(
            onRefresh: () async { await cubit.init(); },
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(p,p,p,0),
              child: Column(
                children: [
                  BookmarkedPalettes(palettes: cubit.palettesView,
                    allPalettes : cubit.palettes),
                  BookmarkedColors(colors: cubit.colorsCodesView,
                      allColors : cubit.colorsCodes)
                ],
              ),
            ),
          );
          }
        },
      ),
    );
  }
}
