import 'package:clipboard/clipboard.dart';
import 'package:color_verse/app/components/default_snakebar.dart';
import 'package:color_verse/app/components/delete_icon_button.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:flutter/material.dart';

class BookmarkColorItem extends StatefulWidget {
  final ColorModel colorModel;
  const BookmarkColorItem({Key? key, required this.colorModel}) : super(key: key);

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
          FlutterClipboard.copy(widget.colorModel.hexCode);
          showDefaultSnackBar(AppStrings.copied);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
                child : TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: AppValues.defaultAnimationTime),
                  builder: (context, double value, _) {
                    return Transform.scale(
                      alignment: Alignment.topLeft,
                      scaleX: value,
                      child: Container(color: widget.colorModel.color),
                    );
                  },
                )
              )
            ),
            const SizedBox(height: AppValues.smallPadding),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppValues.smallerPadding),
              child: Row(
                children: [
                  Text(widget.colorModel.hexCode, style: context.textTheme.labelLarge),
                  const Spacer(),
                  DeleteIconButton(onPressed: (){
                    BookmarksCubit.get(context).deleteBookmarkedColor(widget.colorModel);
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
