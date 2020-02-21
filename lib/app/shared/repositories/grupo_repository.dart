import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/shared/classes/database_create.dart';
import 'package:todo_list/app/shared/classes/return_default.dart';
import 'package:todo_list/app/shared/consts/tables_dml.dart';
import 'package:todo_list/app/shared/interfaces/grupo_repository_interface.dart';

class GrupoRepository implements IGrupoRepositoryInterface {
  @override
  Future<List<Grupo>> getAll() async {
    final sql = '''SELECT * FROM ${TablesDML.gruposTabela}''';
    final data = await Modular.get<DataBaseCreate>().db.rawQuery(sql);
    List<Grupo> grupos = List();

    for (final node in data) {
      final grupo = Grupo.fromJson(node);
      grupos.add(grupo);
    }
    return grupos;
  }

  @override
  Future<ReturnDefault> addGrupo(Grupo grupo) async {
    try {
      final sql = '''INSERT INTO ${TablesDML.gruposTabela}
    (
      ${TablesDML.gruposId},
      ${TablesDML.gruposNome},
      ${TablesDML.gruposCor}
    )
    VALUES (?,?,?)''';
      List<dynamic> params = [
        await gruposCount(),
        grupo.nome,
        grupo.cor
      ];
      final result = await Modular.get<DataBaseCreate>().db.rawInsert(sql, params);
      Modular.get<DataBaseCreate>()
          .databaseLog('Add grupo', sql, null, result, params);
      return ReturnDefault(message: 'Add grupo', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao incluir grupo', status: false, object: null);
    }
  }

  @override
  Future<ReturnDefault> deleteGrupo(Grupo grupo) async {
    try {
      final sql = '''DELETE * FROM ${TablesDML.gruposTabela}
    WHERE ${TablesDML.gruposId} = ?
    ''';

      List<dynamic> params = [grupo.id];
      final result = await Modular.get<DataBaseCreate>().db.rawUpdate(sql, params);

      Modular.get<DataBaseCreate>()
          .databaseLog('Delete grupo', sql, null, result, params);
      return ReturnDefault(message: 'Delete grupo', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao deletar grupo', status: false, object: null);
    }
  }

  @override
  Future<Grupo> getGrupo(int id) async {
    final sql = '''SELECT * FROM ${TablesDML.gruposTabela}
    WHERE ${TablesDML.gruposId} = ?''';

    List<dynamic> params = [id];
    final data = await Modular.get<DataBaseCreate>().db.rawQuery(sql, params);

    final grupo = Grupo.fromJson(data.first);
    return grupo;
  }

  @override
  Future<ReturnDefault> updateGrupo(Grupo grupo) async {
    try {
      final sql = '''UPDATE ${TablesDML.gruposTabela}
    SET ${TablesDML.gruposNome} = ?,
      ${TablesDML.gruposCor} = ?
    WHERE ${TablesDML.tarefasId} = ?
    ''';

      List<dynamic> params = [grupo.nome, grupo.cor, grupo.id];
      final result = await Modular.get<DataBaseCreate>().db.rawUpdate(sql, params);

      Modular.get<DataBaseCreate>()
          .databaseLog('Update grupo', sql, null, result, params);
      return ReturnDefault(message: 'Update grupo', status: true, object: null);
    } catch (e) {
      return ReturnDefault(
          message: 'Erro ao atualizar grupo', status: false, object: null);
    }
  }

  Future<int> gruposCount() async {
    final data = await Modular.get<DataBaseCreate>().db
        .rawQuery('''SELECT COUNT(*) FROM ${TablesDML.gruposTabela}''');

    int count = data[0].values.elementAt(0);
    count = count == null ? 0 : count;
    int idForNewItem = count++;
    return idForNewItem;
  }
}
