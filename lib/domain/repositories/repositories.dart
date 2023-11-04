import 'package:color_verse/domain/entities/color_palette_model.dart';

import '../entities/color_model.dart';

abstract class BaseStorageRepository {
  Future savePalette(ColorPaletteModel palette);
  Future saveColor(ColorModel palette);
  Future<List<ColorPaletteModel>> getPalettes();
  Future<List<ColorModel>> getColors();
  Future deletePalette(ColorPaletteModel palette);
  Future deleteColor(ColorModel color);
}