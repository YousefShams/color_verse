import 'package:color_verse/app/constants/app_palettes.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view_model/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_palette_usecase.dart';
import '../../../domain/usecases/get_palettes_usecase.dart';
import '../../../domain/usecases/save_palette_usecase.dart';


class HomeCubit extends Cubit<HomeState> {
  final GetPalettesUsecase getPalettesUC;
  final SavePaletteUsecase savePaletteUC;
  final DeletePaletteUsecase deletePaletteUC;

  HomeCubit(this.getPalettesUC, this.savePaletteUC,
      this.deletePaletteUC) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //Variables
  List<ColorModel> savedColorsCodes = [];
  List<ColorPaletteModel> savedPalettes = [];
  final palettes = appPalettes;

  //Events
  Future init() async {
    await getBookmarkedPalettes();
  }




  Future getBookmarkedPalettes() async {
    emit(HomeLoadingState());
    final result = await getPalettesUC.execute(null);
    savedPalettes.addAll(result);
    emit(HomeUpdateState());
  }

  bool isPaletteSaved(int index) {
    final palette = palettes[index];
    return savedPalettes.any((savedPalette) => palette.isEqualTo(savedPalette));
  }

  Future togglePaletteFavButton(int index) async {
    final palette = palettes[index];
    final isSaved = isPaletteSaved(index);
    if(!isSaved) {
      await savePaletteUC.execute(palette);
      savedPalettes.add(palette);
      emit(HomeUpdateState());
    }
    else {
      await deletePaletteUC.execute(palette);
      savedPalettes.remove(savedPalettes.firstWhere(
              (savedPalette) => palette.isEqualTo(savedPalette)));
      emit(HomeUpdateState());
    }
  }

}