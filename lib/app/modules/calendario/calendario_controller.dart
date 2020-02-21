import 'package:mobx/mobx.dart';

part 'calendario_controller.g.dart';

class CalendarioController = _CalendarioBase with _$CalendarioController;

abstract class _CalendarioBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  