import 'package:color_verse/data/datasources/storage_datasource.dart';
import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import '../../domain/repositories/repositories.dart';

class StorageRepository implements BaseStorageRepository {
  final StorageDatasource _storageDs;

  const StorageRepository(this._storageDs);

  @override
  Future<List<ColorModel>> getColors() async {
    final colorJson = await _storageDs.getColors();
    return colorJson.map((json)=> ColorModel.fromJson(json)).toList();
  }

  @override
  Future<List<ColorPaletteModel>> getPalettes() async {
    final palettesJson = await _storageDs.getPalettes();
    return palettesJson.map((json) =>
        ColorPaletteModel.fromJson(json)).toList();
  }

  @override
  Future saveColor(ColorModel color) async {
    await _storageDs.saveColor(color.toJson());
  }

  @override
  Future savePalette(ColorPaletteModel palette) async {
    await _storageDs.savePalette(palette.toJson());
  }

  @override
  Future deleteColor(ColorModel color) async {
    await _storageDs.deleteColor(color.toJson());
  }

  @override
  Future deletePalette(ColorPaletteModel palette) async {
    await _storageDs.deletePalette(palette.toJson());
  }

}