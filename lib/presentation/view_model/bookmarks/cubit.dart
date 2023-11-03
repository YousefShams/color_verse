import 'package:color_verse/app/resources/app_shared_prefs_keys.dart';
import 'package:color_verse/presentation/view_model/bookmarks/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/apis/local/local_api.dart';


class BookmarksCubit extends Cubit<BookmarksState> {
  final LocalApi localApi;
  BookmarksCubit(this.localApi) : super(BookmarksInitialState());

  static BookmarksCubit get(context) => BlocProvider.of(context);

  //Variables
  List<String> colorsCodes = [];
  List<List<String>> palettes = [];
  List<String> colorsCodesView = [];
  List<List<String>> palettesView = [];

  //Events
  Future init() async {
    await getBookmarkedPalettes();
    await getBookmarkedColor();
  }


  Future getBookmarkedColor() async {
    emit(BookmarksLoadingState());
    final result = List<String>.from((await localApi.getAll(AppDbKeys.colorsDb)).values.toList() ?? []);
    colorsCodes = result.toList();
    colorsCodesView = colorsCodes.sublist(0, (colorsCodes.length < 4) ? colorsCodes.length : 4);
    emit(BookmarksUpdateState());
  }

  Future getBookmarkedPalettes() async {
    emit(BookmarksLoadingState());
    final result = List<List<String>>.from((await localApi.getAll(AppDbKeys.palettesDb)).values.toList() ?? []);
    palettes = result.toList();
    palettesView = palettes.sublist(0, (palettes.length < 4) ? palettes.length : 4);
    emit(BookmarksUpdateState());
  }

  void deleteBookmarkedColor(String color) {
    localApi.delete(AppDbKeys.colorsDb, color);
    colorsCodes.remove(color);
    colorsCodesView.remove(color);
    emit(BookmarksUpdateState());
  }

  void deleteBookmarkedPalette(List<String> palette) {
    localApi.delete(AppDbKeys.palettesDb, palette.toString());
    palettes.remove(palettes.firstWhere((e) => e.toString()==palette.toString()));
    palettesView.remove(palettesView.firstWhere((e) => e.toString()==palette.toString()));
    emit(BookmarksUpdateState());
  }
}