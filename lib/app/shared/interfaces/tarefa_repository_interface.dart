import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/models/tarefa_model.dart';
import 'package:todo_list/app/shared/classes/return_default.dart';

abstract class ITarefaRepositoryInterface {
  Future<List<Tarefa>> getAll({Grupo grupo, bool finalizado});
  Future<Tarefa> getTarefa(int id);
  Future<ReturnDefault> addTarefa(Tarefa tarefa);
  Future<ReturnDefault> updateTarefa(Tarefa tarefa);
  Future<ReturnDefault> deleteTarefa(Tarefa tarefa);
}