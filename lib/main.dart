import 'package:flutter/material.dart';
import 'package:todo_list/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/shared/classes/database_create.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseCreate dataBaseCreate = DataBaseCreate();
  runApp(ModularApp(module: AppModule(dataBaseCreate)));
}
