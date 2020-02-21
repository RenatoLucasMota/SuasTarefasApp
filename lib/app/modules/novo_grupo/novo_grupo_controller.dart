import 'package:mobx/mobx.dart';

part 'novo_grupo_controller.g.dart';

class NovoGrupoController = _NovoGrupoBase with _$NovoGrupoController;

abstract class _NovoGrupoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  