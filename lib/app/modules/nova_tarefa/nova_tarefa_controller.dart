import 'package:mobx/mobx.dart';

part 'nova_tarefa_controller.g.dart';

class NovaTarefaController = _NovaTarefaBase with _$NovaTarefaController;

abstract class _NovaTarefaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  