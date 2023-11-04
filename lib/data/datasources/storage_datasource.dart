import 'package:color_verse/data/apis/local/local_api.dart';
import '../../app/resources/app_shared_prefs_keys.dart';

abstract class BaseStorageDatasource {
  Future savePalette(Map<String,dynamic> palette);
  Future saveColor(Map<String,dynamic> color);
  Future<List<Map<String,dynamic>>> getPalettes();
  Future<List<Map<String,dynamic>>> getColors();
  Future deletePalette(Map<String,dynamic> palette);
  Future deleteColor(Map<String,dynamic> color);
}

class StorageDatasource implements BaseStorageDatasource  {
  final LocalApi _localApi;

  const StorageDatasource(this._localApi);

  @override
  Future<List<Map<String,dynamic>>> getColors() async {
    final result = await _localApi.getAll(AppDbKeys.colorsDb);
    return result.values.map((e) => Map<String,dynamic>.from(e)).toList() ;
  }

  @override
  Future<List<Map<String,dynamic>>> getPalettes() async {
    final result = await _localApi.getAll(AppDbKeys.palettesDb);
    return result.values.map((e) => Map<String,dynamic>.from(e)).toList() ;
  }

  @override
  Future saveColor(Map<String,dynamic> color) async {
    await _localApi.save(AppDbKeys.colorsDb, {color["id"] : color});
  }

  @override
  Future savePalette(Map<String,dynamic> palette) async {
    await _localApi.save(AppDbKeys.palettesDb, {palette["id"] : palette});
  }

  @override
  Future deleteColor(Map<String, dynamic> color) async {
    _localApi.delete(AppDbKeys.colorsDb, color['id']);
  }

  @override
  Future deletePalette(Map<String, dynamic> palette) async {
    _localApi.delete(AppDbKeys.palettesDb, palette['id']);
  }


}