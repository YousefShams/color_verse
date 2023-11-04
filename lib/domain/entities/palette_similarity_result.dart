// ignore_for_file: hash_and_equals

import 'package:color_verse/domain/entities/color_palette_model.dart';

class PaletteSimilarityResult {

  final ColorPaletteModel palette;
  final double distance;

  const PaletteSimilarityResult(this.palette, this.distance);



  @override
  bool operator ==(Object other) {
    final otherResult = other as PaletteSimilarityResult;
    final isSameDistance = distance == otherResult.distance;
    bool isSamePalette = palette.isEqualTo(other.palette);
    return isSamePalette && isSameDistance;
  }






}