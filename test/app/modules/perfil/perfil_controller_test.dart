import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';


import 'package:todo_list/app/modules/perfil/perfil_controller.dart';
import 'package:todo_list/app/modules/perfil/perfil_module.dart';

void main() {

  initModule(PerfilModule());
  PerfilController perfil;
  
  setUp(() {
      perfil = PerfilModule.to.get<PerfilController>();
  });

  group('PerfilController Test', () {
    test("First Test", () {
      expect(perfil, isInstanceOf<PerfilController>());
    });

    test("Set Value", () {
      expect(perfil.value, equals(0));
      perfil.increment();
      expect(perfil.value, equals(1));
    });
  });

}
  