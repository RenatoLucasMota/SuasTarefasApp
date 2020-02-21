import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/shared/consts/tables_dml.dart';

class DataBaseCreate {
  Database db;

  databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createTabelaTarefas(Database db) async {
    final tarefasSql = '''CREATE TABLE ${TablesDML.tarefasTabela}
    (
      ${TablesDML.tarefasId} INTEGER PRIMARY KEY,
      ${TablesDML.tarefasNome} TEXT,
      ${TablesDML.tarefasFinalizado} BIT NOT NULL,
      ${TablesDML.idGrupo} INTEGER
    )''';

    await db.execute(tarefasSql);
  }

  Future<void> createTabelaGrupos(Database db) async {
    final tarefasSql = '''CREATE TABLE ${TablesDML.gruposTabela}
    (
      ${TablesDML.gruposId} INTEGER PRIMARY KEY,
      ${TablesDML.gruposNome} TEXT,
      ${TablesDML.gruposCor} TEXT
    )''';

    await db.execute(tarefasSql);
  }

  Future<void> createTabelaUsuario(Database db) async {
    final tarefasSql = '''CREATE TABLE ${TablesDML.usuarioTabela}
    (
      ${TablesDML.usuarioId} INTEGER PRIMARY KEY,
      ${TablesDML.usuarioNome} TEXT,
      ${TablesDML.usuarioFoto} TEXT
    )''';

    await db.execute(tarefasSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('tarefas_db');
    db = await openDatabase(path, version: 2, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTabelaUsuario(db);
    await createTabelaGrupos(db);
    await createTabelaTarefas(db);
  }
}
