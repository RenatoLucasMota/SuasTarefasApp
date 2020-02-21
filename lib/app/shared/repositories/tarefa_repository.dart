import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/models/tarefa_model.dart';
import 'package:todo_list/app/shared/classes/database_create.dart';
import 'package:todo_list/app/shared/classes/return_default.dart';
import 'package:todo_list/app/shared/consts/tables_dml.dart';
import 'package:todo_list/app/shared/interfaces/tarefa_repository_interface.dart';

class TodoRepository implements ITarefaRepositoryInterface {
  @override
  Future<ReturnDefault> addTarefa(Tarefa tarefa) async {
    try {
      final sql = '''INSERT INTO ${TablesDML.tarefasTabela}
    (
      ${TablesDML.tarefasId},
      ${TablesDML.tarefasNome},
      ${TablesDML.tarefasFinalizado},
      ${TablesDML.idGrupo}
    )
    VALUES (?,?,?,?)''';
      List<dynamic> params = [
        await tarefasCount(),
        tarefa.nome,
        tarefa.finalizado ? 1 : 0,
        tarefa.idGrupo
      ];
      final result =
          await Modular.get<DataBaseCreate>().db.rawInsert(sql, params);
      Modular.get<DataBaseCreate>()
          .databaseLog('Add Tarefa', sql, null, result, params);
      return ReturnDefault(message: 'Add Tarefa', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao incluir tarefa', status: false, object: null);
    }
  }

  @override
  Future<ReturnDefault> deleteTarefa(Tarefa tarefa) async {
    try {
      final sql = '''DELETE * FROM ${TablesDML.tarefasTabela}
    WHERE ${TablesDML.tarefasId} = ?
    ''';

      List<dynamic> params = [tarefa.id];
      final result =
          await Modular.get<DataBaseCreate>().db.rawUpdate(sql, params);

      Modular.get<DataBaseCreate>()
          .databaseLog('Delete tarefa', sql, null, result, params);
      return ReturnDefault(
          message: 'Delete Tarefa', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao deletar Tarefa', status: false, object: null);
    }
  }

  @override
  Future<List<Tarefa>> getAll({Grupo grupo, bool finalizado}) async {
    final sql = '''SELECT * FROM ${TablesDML.tarefasTabela}
    WHERE ${TablesDML.idGrupo} = ${grupo.id} 
     ORDER BY ${TablesDML.tarefasFinalizado}, ${TablesDML.tarefasId}''';
    final data = await Modular.get<DataBaseCreate>().db.rawQuery(sql);
    List<Tarefa> tarefas = List();
    /*AND ${TablesDML.tarefasFinalizado} = ${finalizado == false ? 0 : 1}*/
    for (final node in data) {
      final tarefa = Tarefa.fromJson(node);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  @override
  Future<Tarefa> getTarefa(int id) async {
    final sql = '''SELECT * FROM ${TablesDML.tarefasTabela}
    WHERE ${TablesDML.tarefasId} = ?''';

    List<dynamic> params = [id];
    final data = await Modular.get<DataBaseCreate>().db.rawQuery(sql, params);

    final tarefa = Tarefa.fromJson(data.first);
    return tarefa;
  }

  @override
  Future<ReturnDefault> updateTarefa(Tarefa tarefa) async {
    try {
      final sql = '''UPDATE ${TablesDML.tarefasTabela}
    SET ${TablesDML.tarefasFinalizado} = ?
    WHERE ${TablesDML.tarefasId} = ?
    ''';

      List<dynamic> params = [tarefa.finalizado, tarefa.id];
      final result =
          await Modular.get<DataBaseCreate>().db.rawUpdate(sql, params);

      Modular.get<DataBaseCreate>()
          .databaseLog('Update tarefa', sql, null, result, params);
      return ReturnDefault(
          message: 'Update tarefa', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao atualizar tarefa', status: false, object: null);
    }
  }

  Future<int> tarefasCount() async {
    final data = await Modular.get<DataBaseCreate>()
        .db
        .rawQuery('''SELECT COUNT(*) FROM ${TablesDML.tarefasTabela}''');

    int count = data[0].values.elementAt(0);
    count = count == null ? 0 : count;
    int idForNewItem = count++;
    return idForNewItem;
  }
}
