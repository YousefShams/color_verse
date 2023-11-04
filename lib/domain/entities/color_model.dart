import 'dart:ui';


class ColorModel {

  final Color color;
  late String id;
  ColorModel(this.color) {
    id = hexCode;
  }

  factory ColorModel.fromJson(Map<String,dynamic> json) {
    String colorString = json['color'].substring(1,json['color'].length);
    colorString = (colorString.length!=8) ? "ff${colorString.toLowerCase()}" : colorString;
    return ColorModel(Color(int.parse("0x$colorString")));
  }

  factory ColorModel.fromHex(String hexCode) {
    hexCode = hexCode.replaceAll("#", "");
    hexCode = (hexCode.length!=8) ? "ff${hexCode.toLowerCase()}" : hexCode;
    return ColorModel(Color(int.parse("0x$hexCode")));
  }

  Map<String,dynamic> toJson() {
    return {
      'color' : hexCode,
      'id' : hexCode
    };
  }

  String get hexCode => '#FF${color.value.toRadixString(16).substring(2).toUpperCase()}';
}