import 'package:hive/hive.dart';

class LocalApi {
  const LocalApi();

  Future<dynamic> get(String dbName, String id) async {
    final database = await Hive.openBox(dbName);
    final result = database.get(id);
    await database.close();
    return result;
  }

  Future<Map<String,dynamic>> getAll(String dbName) async {
    final database = await Hive.openBox(dbName);
    final results = database.toMap();
    await database.close();
    return Map<String,dynamic>.from(results);
  }


  Future save(String dbName, Map<String,dynamic> value) async {
    final database = await Hive.openBox(dbName);
    database.putAll(value);
    await database.close();
  }

  void delete(String dbName, String id) async {
    final database = await Hive.openBox(dbName);
    database.delete(id);
    await database.close();
  }

  Future clear(String dbName) async {
    final database = await Hive.openBox(dbName);
    await database.clear();
    await database.close();
  }

}