import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view_model/color_palette/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_color_usecase.dart';
import '../../../domain/usecases/get_colors_usecase.dart';
import '../../../domain/usecases/save_color_usecase.dart';


class ColorPaletteCubit extends Cubit<ColorPaletteState> {
  final GetColorsUsecase _getColorsUC;
  final SaveColorUsecase _saveColorUC;
  final DeleteColorUsecase _deleteColorUC;

  ColorPaletteCubit(this._getColorsUC, this._saveColorUC,
      this._deleteColorUC) : super(ColorPaletteInitialState());

  static ColorPaletteCubit get(context) => BlocProvider.of(context);

  //Variables
  List<ColorModel> savedColors = [];
  late ColorPaletteModel palette;
  //Events
  Future init(ColorPaletteModel palette) async {
    emit(ColorPaletteLoadingState());
    this.palette = palette;
    await getBookmarkedColor();
    emit(ColorPaletteUpdateState());
  }


  Future getBookmarkedColor() async {
    emit(ColorPaletteLoadingState());
    final result = await _getColorsUC.execute(null);
    savedColors.addAll(result);
    emit(ColorPaletteUpdateState());
  }


  bool isColorSaved(int index) {
    return savedColors.any(
            (colorModel) => colorModel.id == palette.paletteColors[index].id);
  }

  Future toggleColorFavButton(int index) async {
    final color = palette.paletteColors[index];
    final isSaved = isColorSaved(index);
    if(!isSaved) {
      await _saveColorUC.execute(color);
      savedColors.add(color);
      emit(ColorPaletteUpdateState());
    }
    else {
      await _deleteColorUC.execute(color);
      savedColors.remove(color);
      emit(ColorPaletteUpdateState());
    }
  }

}