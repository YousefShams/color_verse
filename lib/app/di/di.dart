
import 'package:color_verse/data/apis/local/local_api.dart';
import 'package:color_verse/data/datasources/storage_datasource.dart';
import 'package:color_verse/data/repositories/storage_repository.dart';
import 'package:color_verse/domain/usecases/delete_color_usecase.dart';
import 'package:color_verse/domain/usecases/delete_palette_usecase.dart';
import 'package:color_verse/domain/usecases/get_colors_usecase.dart';
import 'package:color_verse/domain/usecases/get_palettes_usecase.dart';
import 'package:color_verse/domain/usecases/save_color_usecase.dart';
import 'package:color_verse/domain/usecases/save_palette_usecase.dart';
import 'package:color_verse/presentation/view_model/bookmarks/cubit.dart';
import 'package:color_verse/presentation/view_model/color_palette/cubit.dart';
import 'package:color_verse/presentation/view_model/generate/cubit.dart';
import 'package:color_verse/presentation/view_model/home/cubit.dart';
import 'package:color_verse/presentation/view_model/image/cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future initDependencies() async {

  //Services
  getIt.registerLazySingleton(() => const LocalApi());


  //Datasources
  getIt.registerLazySingleton(() => StorageDatasource(getIt()));


  //Repositories
  getIt.registerLazySingleton(() => StorageRepository(getIt()));


  //Usecases
  getIt.registerLazySingleton(() => GetColorsUsecase(getIt()));
  getIt.registerLazySingleton(() => GetPalettesUsecase(getIt()));
  getIt.registerLazySingleton(() => SaveColorUsecase(getIt()));
  getIt.registerLazySingleton(() => SavePaletteUsecase(getIt()));
  getIt.registerLazySingleton(() => DeleteColorUsecase(getIt()));
  getIt.registerLazySingleton(() => DeletePaletteUsecase(getIt()));


  //Cubits
  getIt.registerFactory(() => HomeCubit(getIt(),getIt(),getIt()));
  getIt.registerFactory(() => GenerateCubit(getIt()));
  getIt.registerFactory(() => BookmarksCubit(getIt(),getIt(),getIt(),getIt()));
  getIt.registerFactory(() => ImageCubit(getIt()));
  getIt.registerFactory(() => ColorPaletteCubit(getIt(),getIt(),getIt()));

}