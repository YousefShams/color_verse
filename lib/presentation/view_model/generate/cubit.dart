import 'dart:ui';
import 'package:color_verse/app/constants/constants.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/resources/app_palettes.dart';
import 'package:color_verse/app/resources/app_shared_prefs_keys.dart';
import 'package:color_verse/domain/entities/palette_similarity_result.dart';
import 'package:color_verse/presentation/view_model/generate/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GenerateCubit extends Cubit<GenerateState> {

  GenerateCubit() : super(GenerateInitialState());

  static GenerateCubit get(context) => BlocProvider.of(context);

  //Variables
  Color? prevPickedColor;
  Color pickedColor = AppColors.primaryColor;
  PaletteSimilarityResult? generatedPalette;
  bool get isPaletteGenerated => generatedPalette != null;
  List<PaletteSimilarityResult> results = [];

  //Events
  void onColorChanged(Color color) {
    pickedColor = color;
    emit(GenerateUpdateState());
  }

  void generatePalettes() {
    if(prevPickedColor?.value != pickedColor.value || results.isEmpty) {
      results.clear();
      final colorHexCode = AppFunctions.getHexCodeFromColor(pickedColor);
      for (var palette in appPalettes) {
        final distance = AppFunctions.calculateColorDistanceFromPalette(
            colorHexCode, palette);
        if(distance < AppConsts.maxPaletteDistance) {
          results.add(PaletteSimilarityResult(palette, distance));
        }
      }
      results.sort((a, b) => a.distance.compareTo(b.distance));
    }

    if(generatedPalette != null) {
      if(results.length > 1 && prevPickedColor == pickedColor) {
        results.remove(results.firstWhere((e) => e == generatedPalette));
      }
    }
    generatedPalette = results.first;
    prevPickedColor = pickedColor;
    emit(GenerateUpdateState());
  }

  Future savePalette() async {
    if(isPaletteGenerated) {
      final sharedPref = await SharedPreferences.getInstance();
      final savedPalettes= sharedPref.getStringList(AppSharedPrefsKeys.savedPalettes) ?? [];
      print(savedPalettes);
      final currentPalette = generatedPalette!.palette.join(",");
      final palettesToSave = [...savedPalettes, currentPalette];
      await sharedPref.setStringList(AppSharedPrefsKeys.savedPalettes, palettesToSave);
    }
  }

}