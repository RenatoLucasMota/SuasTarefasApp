  import 'package:todo_list/app/modules/novo_grupo/novo_grupo_controller.dart';
  import 'package:flutter_modular/flutter_modular.dart';
  import 'package:todo_list/app/modules/novo_grupo/novo_grupo_page.dart';
  class NovoGrupoModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => NovoGrupoController()),];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => NovoGrupoPage()),];

  static Inject get to => Inject<NovoGrupoModule>.of();

}
  