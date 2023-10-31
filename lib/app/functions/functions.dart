
import 'package:color_verse/app/constants/platte_color_names.dart';

class AppFunctions {

  static int formatHexCodeToColorInput(String hexCode) {
    hexCode = hexCode.substring(1,hexCode.length);
    hexCode = (hexCode.length!=8) ? "ff${hexCode.toLowerCase()}" : hexCode;
    return int.parse("0x$hexCode");
  }

  static String getColorNameFromHexCodes(List<String> hexCodes) {
    final copy = hexCodes.toList()..shuffle();
    return copy.sublist(0,3).fold("",(prev , curr) => "$prev#${findNearestColorName(curr)}  ");

  }

  static String findNearestColorName(String hexColor) {
    // Convert the input hex color string to uppercase for consistency.
    hexColor = hexColor.toUpperCase();

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