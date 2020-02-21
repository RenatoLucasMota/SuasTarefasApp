  import 'package:todo_list/app/modules/calendario/calendario_controller.dart';
  import 'package:flutter_modular/flutter_modular.dart';
  import 'package:todo_list/app/modules/calendario/calendario_page.dart';
  class CalendarioModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => CalendarioController()),];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => CalendarioPage()),];

  static Inject get to => Inject<CalendarioModule>.of();

}
  