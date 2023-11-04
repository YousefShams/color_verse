import 'package:color_verse/data/repositories/storage_repository.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/domain/usecases/base_usecase.dart';

class DeletePaletteUsecase implements BaseUsecaseFuture<ColorPaletteModel,void> {
  final StorageRepository _storageRepo;

  const DeletePaletteUsecase(this._storageRepo);

  @override
  Future<void> execute(ColorPaletteModel input) async  {
    return await _storageRepo.deletePalette(input);
  }

}