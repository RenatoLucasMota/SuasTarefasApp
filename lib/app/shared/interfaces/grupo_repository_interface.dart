import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/shared/classes/return_default.dart';

abstract class IGrupoRepositoryInterface {
  Future<List<Grupo>> getAll();
  Future<Grupo> getGrupo(int id);
  Future<ReturnDefault> addGrupo(Grupo grupo);
  Future<ReturnDefault> updateGrupo(Grupo grupo);
  Future<ReturnDefault> deleteGrupo(Grupo grupo);
}