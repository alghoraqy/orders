import 'package:flutter/material.dart';
import 'package:orders/core/app/app_initializer.dart';
import 'package:orders/core/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initSettings();
  runApp(const MyApp());
}
