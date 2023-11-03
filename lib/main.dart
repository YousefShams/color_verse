import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/application/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}
