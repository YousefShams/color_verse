
import 'dart:math';
import 'dart:ui';

import 'package:color_verse/app/constants/palette_color_names.dart';

class AppFunctions {


  static String getColorNameFromHexCodes(List<String> hexCodes) {
    final copy = hexCodes.toList();
    return copy.sublist(0,3).fold("",(prev , curr) => "$prev#${findNearestColorName(curr)}  ");

  }

  static String getColorNameFromCode(String hexCode) {
    final result = findNearestColorName(hexCode);
    return result.split("_").map((word) => word[0].toUpperCase()+word.substring(1)).join(" ");
  }

  static String getHexCodeFromColor(Color color) {
    return '#FF${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }


  static Color _hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    int value = int.parse(hexColor, radix: 16);
    return Color(value);
  }

  static double calculateColorDistanceFromPalette(String hexColor, List<String> palette) {
    Color color = _hexToColor(hexColor);
    double? minDistance;
    for(var paletteColorCode in palette) {
      Color paletteColor = _hexToColor(paletteColorCode);

      int r = (color.red - paletteColor.red).abs();
      int g = (color.green - paletteColor.green).abs();
      int b = (color.blue - paletteColor.blue).abs();
      final distance = (r+g+b)/3;
      if(minDistance == null) {
        minDistance = distance;
      }
      else {
        minDistance = min(minDistance, distance);
      }
    }

    return minDistance!;
  }

  static String findNearestColorName(String hexColor) {
    // Convert the input hex color string to uppercase for consistency.

    hexColor = hexColor.toUpperCase();
    hexColor = hexColor.length == 9 ? "#${hexColor.substring(3)}" : hexColor;
    double minDistance = double.infinity;
    late String nearestColorName;

    // Iterate through the CSS named colors and calculate the distance to the input color.
    palettesColorNames.forEach((colorName, colorValue) {
      double r1 = int.parse(hexColor.substring(1, 3), radix: 16).toDouble();
      double g1 = int.parse(hexColor.substring(3, 5), radix: 16).toDouble();
      double b1 = int.parse(hexColor.substring(5, 7), radix: 16).toDouble();

      double r2 = int.parse(colorValue.substring(1, 3), radix: 16).toDouble();
      double g2 = int.parse(colorValue.substring(3, 5), radix: 16).toDouble();
      double b2 = int.parse(colorValue.substring(5, 7), radix: 16).toDouble();

      double distance = (r1 - r2).abs() + (g1 - g2).abs() + (b1 - b2).abs();

      if (distance < minDistance) {
        minDistance = distance;
        nearestColorName = colorName;
      }
    });

    return nearestColorName;
  }

}