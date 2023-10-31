import 'package:color_verse/app/components/color_pallete_widget.dart';
import 'package:flutter/material.dart';

class ColorPalettesList extends StatelessWidget {
  final List<List<String>> colorPalettes;
  const ColorPalettesList({Key? key, required this.colorPalettes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: colorPalettes.length,
        itemBuilder: (context, index) =>
            ColorPaletteWidget(hexColors: colorPalettes[index]),
      ),
    );
  }
}
