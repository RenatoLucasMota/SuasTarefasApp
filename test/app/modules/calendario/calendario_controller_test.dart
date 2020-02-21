import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/app/modules/calendario/calendario_controller.dart';
import 'package:todo_list/app/modules/calendario/calendario_module.dart';

void main() {

  initModule(CalendarioModule());
  CalendarioController calendario;
  
  setUp(() {
      calendario = CalendarioModule.to.get<CalendarioController>();
  });

  group('CalendarioController Test', () {
    test("First Test", () {
      expect(calendario, isInstanceOf<CalendarioController>());
    });

    test("Set Value", () {
      expect(calendario.value, equals(0));
      calendario.increment();
      expect(calendario.value, equals(1));
    });
  });

}
  