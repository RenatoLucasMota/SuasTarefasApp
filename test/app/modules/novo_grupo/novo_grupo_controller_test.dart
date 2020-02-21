import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/app/modules/novo_grupo/novo_grupo_controller.dart';
import 'package:todo_list/app/modules/novo_grupo/novo_grupo_module.dart';

void main() {

  initModule(NovoGrupoModule());
  NovoGrupoController novogrupo;
  
  setUp(() {
      novogrupo = NovoGrupoModule.to.get<NovoGrupoController>();
  });

  group('NovoGrupoController Test', () {
    test("First Test", () {
      expect(novogrupo, isInstanceOf<NovoGrupoController>());
    });

    test("Set Value", () {
      expect(novogrupo.value, equals(0));
      novogrupo.increment();
      expect(novogrupo.value, equals(1));
    });
  });

}
  