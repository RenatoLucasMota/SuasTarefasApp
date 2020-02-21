import 'package:flutter/material.dart';
import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/models/tarefa_model.dart';

class MockApp {
  static List<Grupo> grupos = [
    Grupo(
      id: 1,
      nome: 'Trabalho',
      cor: Colors.red.toString(),
    ),
    Grupo(
      id: 2,
      nome: 'Casa',
      //cor: Colors.green,
    ),
    Grupo(
      id: 3,
      nome: 'Aprender Inglês',
      //cor: Colors.yellow,
    ),
    Grupo(
      id: 4,
      nome: 'Férias de Verão do Trabalho',
      //cor: Colors.orange,
    ),
    Grupo(
      id: 5,
      nome: 'Estudos Faculdade',
      //cor: Colors.blue,
    ),
    Grupo(
      id: 6,
      nome: 'Treino Academia',
      //cor: Colors.teal,
    ),
    Grupo(
      id: 7,
      nome: 'Estudar Flutter',
      //cor: Colors.lightBlue,
    ),
    Grupo(
      id: 8,
      nome: 'Estudar Dart',
      //cor: Colors.white,
    ),
  ];

  static List<Tarefa> todos = [
    Tarefa(id: 1, finalizado: false, nome: 'Corrigir Bug', idGrupo: 1),
    Tarefa(id: 2, finalizado: false, nome: 'Fazer CheckList', idGrupo: 1),
    Tarefa(id: 3, finalizado: false, nome: 'Limpar a casa', idGrupo: 2),
    Tarefa(id: 4, finalizado: false, nome: 'Lavar Louça', idGrupo: 2),
    Tarefa(id: 5, finalizado: false, nome: 'Arrumar a cama', idGrupo: 2),
    Tarefa(
        id: 6, finalizado: false, nome: 'Ouvir Podcasts em Inglês', idGrupo: 3),
    Tarefa(id: 7, finalizado: false, nome: 'Ver vídeos em Inglês', idGrupo: 3),
    Tarefa(id: 8, finalizado: false, nome: 'Viajar para praia', idGrupo: 4),
    Tarefa(id: 9, finalizado: false, nome: 'Comer camarão', idGrupo: 4),
    Tarefa(id: 10, finalizado: false, nome: 'Fazer Trilha', idGrupo: 4),
    Tarefa(id: 11, finalizado: false, nome: 'Ler livros', idGrupo: 5),
    Tarefa(id: 12, finalizado: false, nome: 'Estudar para Provas', idGrupo: 5),
  ];
}
