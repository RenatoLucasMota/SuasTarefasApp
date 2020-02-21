import 'package:todo_list/app/shared/consts/tables_dml.dart';

class Tarefa {
  int id;
  String nome;
  String detalhes;
  int idGrupo;
  bool finalizado;

  Tarefa({
    this.id,
    this.nome,
    this.detalhes,
    this.idGrupo,
    this.finalizado,
  });

  Tarefa.fromJson(Map<String, dynamic> json) {
    this.id = json[TablesDML.tarefasId];
    this.nome = json[TablesDML.tarefasNome];
    this.finalizado = json[TablesDML.tarefasFinalizado] == 0 ? false: true;
    this.idGrupo = json[TablesDML.idGrupo];
  }
}
