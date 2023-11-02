import 'package:color_verse/presentation/view/color_palette/components/color_palette_item.dart';
import 'package:flutter/material.dart';

class ColorPaletteScreen extends StatelessWidget {
  const ColorPaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hexCodes = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      body: Column(
        children: List.generate(
          hexCodes.length,
          (index) => ColorPaletteItem(hexCode: hexCodes[index], index: index)
        ),
      ),
    );
  }
}
