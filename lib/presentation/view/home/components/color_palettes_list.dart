import 'package:color_verse/app/components/color_pallete_widget.dart';
import 'package:flutter/material.dart';

class ColorPalettesList extends StatelessWidget {
  final List<List<String>> colorPalettes;
  final Function onPaletteSave;
  final Function isPaletteSaved;
  const ColorPalettesList({Key? key, required this.colorPalettes,
    required this.onPaletteSave, required this.isPaletteSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: colorPalettes.length,
        itemBuilder: (context, index) =>
            ColorPaletteWidget(hexColors: colorPalettes[index],
              onPaletteSave: () { onPaletteSave(index); },
              isPaletteSaved:  isPaletteSaved(index),
            ),
      ),
    );
  }
}
