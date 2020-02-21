import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';


import 'package:todo_list/app/modules/tarefa/tarefa_controller.dart';
import 'package:todo_list/app/modules/tarefa/tarefa_module.dart';

void main() {

  initModule(TarefaModule());
  TarefaController tarefa;
  
  setUp(() {
      tarefa = TarefaModule.to.get<TarefaController>();
  });

  group('TarefaController Test', () {
    test("First Test", () {
      expect(tarefa, isInstanceOf<TarefaController>());
    });

    
  });

}
  