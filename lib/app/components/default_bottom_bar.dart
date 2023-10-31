import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class DefaultBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onChange;
  const DefaultBottomNavBar({Key? key,
    required this.currentIndex, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return Container(
      padding: const EdgeInsets.only(left: p/2, right: p/2, bottom: p/2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
        boxShadow: [BoxShadow(color: context.textTheme.titleLarge!.color!.withOpacity(0.3),
            blurRadius: 13, spreadRadius: -15, offset: const Offset(3, 5))]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onChange,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.defaultIconColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: AppStrings.home),
            BottomNavigationBarItem(icon: Icon(Icons.edit_rounded), label: AppStrings.generate),
            BottomNavigationBarItem(icon: Icon(Icons.image_rounded), label: AppStrings.images),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: AppStrings.bookmarks),
          ],
        ),
      ),
    );
  }
}
