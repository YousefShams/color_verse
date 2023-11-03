import 'package:color_verse/app/components/color_palette_row.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ImagePalette extends StatelessWidget {
  final List<String>? palette;
  const ImagePalette({Key? key, required this.palette}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pushNamed(context, AppRoutes.colorPaletteRoute,
          arguments: palette); },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppValues.defaultBorderRadius),
          bottomRight: Radius.circular(AppValues.defaultBorderRadius),
        ),
        child: SizedBox(
          width: double.maxFinite,
          height: AppValues.colorPaletteHeight,
          child: (palette!=null) ? ColorPaletteRow(hexColors: palette!,
              borderRadius: 0)
              : const SizedBox.shrink()
        ),
      ),
    );
  }
}
