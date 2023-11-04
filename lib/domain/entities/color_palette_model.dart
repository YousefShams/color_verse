import 'package:color_verse/domain/entities/color_model.dart';

class ColorPaletteModel {

  final List<ColorModel> paletteColors;
  late String id;

  ColorPaletteModel(this.paletteColors) {
    id = paletteColors.map((e) => e.hexCode).toList().join();
  }

  factory ColorPaletteModel.fromJson(Map<String, dynamic> json) {
    final paletteCodes = json['paletteCodes'];
    return ColorPaletteModel(
      List<ColorModel>.from(paletteCodes.map((e) =>
          ColorModel.fromJson(Map<String,dynamic>.from(e))))
    );
  }

  factory ColorPaletteModel.fromHexCodes(List<String> hexCodes) {
    return ColorPaletteModel(
        hexCodes.map((code) => ColorModel.fromHex(code)).toList()
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'paletteCodes' : paletteColors.map((code) => code.toJson()).toList(),
      'id' : id
    };
  }

  bool isEqualTo(ColorPaletteModel otherPalette) {
    return id == otherPalette.id;
  }

  int get length => paletteColors.length;

  List<String> get hexCodes {
    return paletteColors.map((e) => e.hexCode).toList();
  }
}