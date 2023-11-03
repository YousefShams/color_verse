import 'package:color_verse/app/resources/app_shared_prefs_keys.dart';
import 'package:color_verse/presentation/view_model/color_palette/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/apis/local/local_api.dart';


class ColorPaletteCubit extends Cubit<ColorPaletteState> {
  final LocalApi localApi;
  ColorPaletteCubit(this.localApi) : super(ColorPaletteInitialState());

  static ColorPaletteCubit get(context) => BlocProvider.of(context);

  //Variables
  List<String> savedColorsCodes = [];
  List<String> palette = [];
  //Events
  Future init(List<String> hexCodes) async {
    emit(ColorPaletteLoadingState());
    palette.addAll(hexCodes);
    await getBookmarkedColor();
    emit(ColorPaletteUpdateState());
  }


  Future getBookmarkedColor() async {
    emit(ColorPaletteLoadingState());
    final result = List<String>.from((await localApi.getAll(AppDbKeys.colorsDb)).values.toList() ?? []);
    savedColorsCodes.addAll(result);
    emit(ColorPaletteUpdateState());
  }


  bool isColorSaved(int index) {
    return savedColorsCodes.any((colorCode) => colorCode == palette[index]);
  }

  Future toggleColorFavButton(int index) async {
    final color = palette[index];
    final isSaved = isColorSaved(index);
    if(!isSaved) {
      await localApi.save(AppDbKeys.colorsDb, {color: color});
      savedColorsCodes.add(color);
      emit(ColorPaletteUpdateState());
    }
    else {
      localApi.delete(AppDbKeys.colorsDb, color);
      savedColorsCodes.remove(color);
      emit(ColorPaletteUpdateState());
    }
  }

}