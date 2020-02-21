  import 'package:todo_list/app/modules/nova_tarefa/nova_tarefa_controller.dart';
  import 'package:flutter_modular/flutter_modular.dart';
  import 'package:todo_list/app/modules/nova_tarefa/nova_tarefa_page.dart';
  class NovaTarefaModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => NovaTarefaController()),];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => NovaTarefaPage()),];

  static Inject get to => Inject<NovaTarefaModule>.of();

}
  