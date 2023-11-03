import 'dart:ui';

abstract class BaseStorageDatasource {
  Future savePalette(List<String> palette);
  Future saveColor(List<String> palette);
  Future<List<List<Color>>> getPalettes();
  Future<List<Color>> getColors();
}