import 'package:color_verse/app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/application/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDependencies();
  // final x = await Hive.openBox(AppDbKeys.palettesDb);
  // await x.clear();
  runApp(const MyApp());
}
