
import 'package:color_verse/data/repositories/storage_repository.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/usecases/base_usecase.dart';

class DeleteColorUsecase implements BaseUsecaseFuture<ColorModel,void> {

  final StorageRepository _storageRepo;
  const DeleteColorUsecase(this._storageRepo);

  @override
  Future<void> execute(ColorModel input) async  {
    return await _storageRepo.deleteColor(input);
  }

}