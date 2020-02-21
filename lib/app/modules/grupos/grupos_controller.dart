import 'package:mobx/mobx.dart';

part 'grupos_controller.g.dart';

class GruposController = _GruposBase with _$GruposController;

abstract class _GruposBase with Store {
  @observable
  bool animou = false;

  @action 
  setAnimou(bool value) {
    animou = value;
  }
}
  