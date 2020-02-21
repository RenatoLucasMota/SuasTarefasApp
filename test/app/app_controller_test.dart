import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/app_module.dart';

void main() {

  initModule(AppModule(null));
  AppController app;
  
  setUp(() {
      app = AppModule.to.get<AppController>();
  });

  group('AppController Test', () {
    test("First Test", () {
      expect(app, isInstanceOf<AppController>());
    });
  });

}
  