import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view_model/bookmarks/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_color_usecase.dart';
import '../../../domain/usecases/delete_palette_usecase.dart';
import '../../../domain/usecases/get_colors_usecase.dart';
import '../../../domain/usecases/get_palettes_usecase.dart';


class BookmarksCubit extends Cubit<BookmarksState> {
  final GetPalettesUsecase _getPalettesUC;
  final GetColorsUsecase _getColorsUC;
  final DeleteColorUsecase _deleteColorUC;
  final DeletePaletteUsecase _deletePaletteUC;
  BookmarksCubit(this._getPalettesUC, this._getColorsUC, this._deleteColorUC, this._deletePaletteUC) : super(BookmarksInitialState());

  static BookmarksCubit get(context) => BlocProvider.of(context);

  //Variables
  List<ColorModel> colors = [];
  List<ColorPaletteModel> palettes = [];
  List<ColorModel> colorsView = [];
  List<ColorPaletteModel> palettesView = [];

  //Events
  Future init() async {
    await getBookmarkedPalettes();
    await getBookmarkedColor();
  }


  Future getBookmarkedColor() async {
    emit(BookmarksLoadingState());
    colors = await _getColorsUC.execute(null);
    colorsView = colors.sublist(0, (colors.length < 4) ? colors.length : 4);
    emit(BookmarksUpdateState());
  }

  Future getBookmarkedPalettes() async {
    emit(BookmarksLoadingState());
    palettes = await _getPalettesUC.execute(null);
    palettesView = palettes.sublist(0, (palettes.length < 4) ? palettes.length : 4);
    emit(BookmarksUpdateState());
  }

  Future deleteBookmarkedColor(ColorModel color) async {
    await _deleteColorUC.execute(color);
    colors.removeWhere((c) => c.id == color.id);
    colorsView.removeWhere((c) => c.id == color.id);
    emit(BookmarksUpdateState());
  }

  Future deleteBookmarkedPalette(ColorPaletteModel palette) async {
    await _deletePaletteUC.execute(palette);
    palettes.remove(palettes.firstWhere((e) => e.id==palette.id));
    palettesView.remove(palettesView.firstWhere((e) => e.id==palette.id));
    emit(BookmarksUpdateState());
  }
}