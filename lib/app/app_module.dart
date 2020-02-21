import 'package:todo_list/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/app_widget.dart';
import 'package:todo_list/app/modules/grupos/grupos_controller.dart';
import 'package:todo_list/app/modules/home/home_module.dart';
import 'package:todo_list/app/modules/splash/splash_page.dart';
import 'package:todo_list/app/shared/classes/database_create.dart';
import 'package:todo_list/app/shared/interfaces/grupo_repository_interface.dart';
import 'package:todo_list/app/shared/interfaces/tarefa_repository_interface.dart';
import 'package:todo_list/app/shared/repositories/grupo_repository.dart';
import 'package:todo_list/app/shared/repositories/tarefa_repository.dart';

class AppModule extends MainModule {
  final DataBaseCreate dataBaseCreate;

  AppModule(this.dataBaseCreate);

  @override
  List<Bind> get binds {
    return [
      Bind((i) => AppController()),
      Bind((i) => GruposController()),
      Bind<DataBaseCreate>((i) => dataBaseCreate),
      Bind<IGrupoRepositoryInterface>((i) => GrupoRepository()),
      Bind<ITarefaRepositoryInterface>((i) => TodoRepository()),
    ];
  }

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
