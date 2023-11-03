import 'package:color_verse/app/constants/app_palettes.dart';
import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/app/resources/app_shared_prefs_keys.dart';
import 'package:color_verse/presentation/view_model/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/apis/local/local_api.dart';


class HomeCubit extends Cubit<HomeState> {
  final LocalApi localApi;
  HomeCubit(this.localApi) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //Variables
  List<String> savedColorsCodes = [];
  List<List<String>> savedPalettes = [];

  //Events
  Future init() async {
    await getBookmarkedPalettes();
  }




  Future getBookmarkedPalettes() async {
    emit(HomeLoadingState());
    final result = List<List<String>>.from((await localApi.getAll(AppDbKeys.palettesDb)).values.toList() ?? []);
    savedPalettes.addAll(result);
    emit(HomeUpdateState());
  }

  bool isPaletteSaved(int index) {
    final palette = appPalettes[index];
    return savedPalettes.any((savedPalette) => AppFunctions.isPalettesEqual(savedPalette, palette));
  }

  Future togglePaletteFavButton(int index) async {
    final palette = appPalettes[index];
    final isSaved = isPaletteSaved(index);
    if(!isSaved) {
      await localApi.save(AppDbKeys.palettesDb, {palette.toString() : palette});
      savedPalettes.add(palette);
      emit(HomeUpdateState());
    }
    else {
      localApi.delete(AppDbKeys.palettesDb, palette.toString());
      savedPalettes.remove(savedPalettes.firstWhere(
         (e) => AppFunctions.isPalettesEqual(e, palette)));
      emit(HomeUpdateState());
    }
  }

}