import 'package:color_verse/data/repositories/storage_repository.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/usecases/base_usecase.dart';

class GetColorsUsecase implements BaseUsecaseFuture<void,List<ColorModel>> {
  final StorageRepository _storageRepo;

  const GetColorsUsecase(this._storageRepo);

  @override
  Future<List<ColorModel>> execute(input) async  {
    return await _storageRepo.getColors();
  }

}