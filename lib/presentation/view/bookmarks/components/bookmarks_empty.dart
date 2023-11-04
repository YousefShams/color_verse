import 'package:color_verse/app/components/app_title.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookmarksEmpty extends StatelessWidget {
  final String text;
  final String asset;
  final int flex;
  const BookmarksEmpty({Key? key, required this.text,
    required this.asset, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(title: text),
            Expanded(child: Center(child: Lottie.asset(asset)))
          ],
        )
    );
  }
}
