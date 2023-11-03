import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/bookmarks/components/bookmark_color_item.dart';
import 'package:flutter/material.dart';
import '../../../../app/components/page_title.dart';
import '../../../../app/resources/app_strings.dart';

class BookmarkedColors extends StatelessWidget {
  final List<String> colors;
  const BookmarkedColors({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: colors.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const PageTitle(title: AppStrings.yourColors),
              const Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Text(AppStrings.seeAll, style: context.textTheme.labelLarge)
              ),
            ],
          ),
          const SizedBox(height: AppValues.pagePadding),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 16/9,
                crossAxisCount: 2, crossAxisSpacing: AppValues.pagePadding,
                mainAxisSpacing: AppValues.pagePadding
              ),
              itemCount: colors.length,
              itemBuilder: (context,index) => BookmarkColorItem(color: colors[index])
            ),
          )
        ],
      ),
    );
  }
}
