import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/generate/components/color_picker_widget.dart';
import 'package:flutter/material.dart';
import '../../../../app/components/default_button.dart';
import '../../../../app/resources/app_strings.dart';

class PickColorButton extends StatelessWidget {
  final Color pickedColor;
  final Function(Color) onChanged;
  const PickColorButton({Key? key,
    required this.pickedColor, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultButton(text: AppStrings.pickColor,onPressed: (){
         showModalBottomSheet(
             context: context,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             shape: RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(AppValues.defaultBorderRadius)),
             enableDrag: false, showDragHandle: true,
             builder: (context) => DefaultColorPicker(pickedColor: pickedColor, onChanged: onChanged)
         );
        }),
        const Spacer(),
        Container(
          width: 35,
          height: 20,
          decoration: BoxDecoration(color: pickedColor, borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
