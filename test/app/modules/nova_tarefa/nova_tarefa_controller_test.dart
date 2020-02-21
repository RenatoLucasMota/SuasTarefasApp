import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/app/modules/nova_tarefa/nova_tarefa_controller.dart';
import 'package:todo_list/app/modules/nova_tarefa/nova_tarefa_module.dart';

void main() {

  initModule(NovaTarefaModule());
  NovaTarefaController novatarefa;
  
  setUp(() {
      novatarefa = NovaTarefaModule.to.get<NovaTarefaController>();
  });

  group('NovaTarefaController Test', () {
    test("First Test", () {
      expect(novatarefa, isInstanceOf<NovaTarefaController>());
    });

    test("Set Value", () {
      expect(novatarefa.value, equals(0));
      novatarefa.increment();
      expect(novatarefa.value, equals(1));
    });
  });

}
  