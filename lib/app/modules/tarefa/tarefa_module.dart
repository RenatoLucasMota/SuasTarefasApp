  import 'package:todo_list/app/modules/tarefa/tarefa_controller.dart';
  import 'package:flutter_modular/flutter_modular.dart';
  import 'package:todo_list/app/modules/tarefa/tarefa_page.dart';
  class TarefaModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => TarefaController()),];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => TarefaPage()),];

  static Inject get to => Inject<TarefaModule>.of();

}
  