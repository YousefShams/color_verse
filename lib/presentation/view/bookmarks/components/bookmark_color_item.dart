import 'package:clipboard/clipboard.dart';
import 'package:color_verse/app/components/default_snakebar.dart';
import 'package:color_verse/app/components/delete_icon_button.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:flutter/material.dart';

class BookmarkColorItem extends StatefulWidget {
  final String color;
  const BookmarkColorItem({Key? key, required this.color}) : super(key: key);

  @override
  State<BookmarkColorItem> createState() => _BookmarkColorItemState();
}

class _BookmarkColorItemState extends State<BookmarkColorItem> {
  bool deleted = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !deleted,
      child: GestureDetector(
        onTap: () {
          FlutterClipboard.copy(widget.color);
          showDefaultSnackBar(context, AppStrings.copied);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
              child : Container(
                color: Color(AppFunctions.formatHexCodeToColorInput(widget.color)),
              ),
            )),
            const SizedBox(height: AppValues.smallPadding),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppValues.smallerPadding),
              child: Row(
                children: [
                  Text(widget.color, style: context.textTheme.labelLarge),
                  const Spacer(),
                  DeleteIconButton(onPressed: (){
                    BookmarksCubit.get(context).deleteBookmarkedColor(widget.color);
                    setState(() { deleted = true; });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
