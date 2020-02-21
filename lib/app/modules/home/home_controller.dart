import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String heroTag = '';

  @observable
  int pageIndex = 0;

  @action 
  setPageIndex(int value) {
    pageIndex = value;
  }

  @action 
  setHeroTag(String value) {
    heroTag = value;
  }
}