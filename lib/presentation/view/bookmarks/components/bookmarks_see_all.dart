import 'package:color_verse/app/components/loading_screen.dart';
import 'package:color_verse/app/components/page_title.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/apis/local/local_api.dart';
import '../../../view_model/bookmarks/cubit.dart';
import '../../../view_model/bookmarks/state.dart';

class BookmarksSeeAllPage extends StatelessWidget {
  final Widget child;
  final String title;
  const BookmarksSeeAllPage({Key? key,
    required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (cubitContext) => BookmarksCubit(const LocalApi())..init(),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (cubitContext, state) {
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
                  PageTitle(title: title),
                  const SizedBox(height: AppValues.pagePadding),
                  Expanded(child: child)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
