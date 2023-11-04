import 'package:color_verse/data/repositories/storage_repository.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/domain/usecases/base_usecase.dart';

class GetPalettesUsecase implements BaseUsecaseFuture<void,List<ColorPaletteModel>> {
  final StorageRepository _storageRepo;

  const GetPalettesUsecase(this._storageRepo);

  @override
  Future<List<ColorPaletteModel>> execute(void input) async  {
    return await _storageRepo.getPalettes();
  }

}