import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/app/models/tarefa_model.dart';
import 'package:todo_list/app/shared/classes/database_create.dart';
import 'package:todo_list/app/shared/interfaces/grupo_repository_interface.dart';
import 'package:todo_list/app/shared/interfaces/tarefa_repository_interface.dart';

import 'models/grupo_model.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  final ITarefaRepositoryInterface _tarefaRepository = Modular.get();
  final IGrupoRepositoryInterface _grupoRepository = Modular.get();

  @observable
  int pageIndex;

  @observable
  Grupo grupoAtual;

  @observable
  bool databaseCriado = false;

  @observable
  ObservableList<Tarefa> listaTarefas;

  @observable
  ObservableList<Tarefa> listaTarefasFinalizados;

  @observable
  ObservableList<Grupo> listaGrupos;

  @action
  loadListaTarefas() async {
    this.listaTarefas = ObservableList.of(
        await _tarefaRepository.getAll(grupo: grupoAtual, finalizado: false));
    this.listaTarefasFinalizados = ObservableList.of(
        await _tarefaRepository.getAll(grupo: grupoAtual, finalizado: true));
  }

  @action
  loadListaGrupos() async {
    this.listaGrupos = ObservableList.of(await _grupoRepository.getAll());
  }

  @action
  setPushToPage({int pageIndex}) {
    this.pageIndex = pageIndex;
  }

  @action
  setGrupoAtual({Grupo grupo}) {
    this.grupoAtual = grupo;
  }

  @action
  updateTarefa({Tarefa terefa}) {
    _tarefaRepository.updateTarefa(terefa);
  }

  Future<Grupo> getGrupo({int id}) async => await _grupoRepository.getGrupo(id);

  @action
  initDatabase() async {
    try {
      print('Criando database');
      await Future.delayed(Duration(milliseconds: 1500));
      await Modular.get<DataBaseCreate>().initDatabase();
      await _grupoRepository
          .addGrupo(Grupo(nome: 'Grupo 1', cor: Colors.red.toString()));
      await _grupoRepository
          .addGrupo(Grupo(nome: 'Grupo 2', cor: Colors.red.toString()));

      await _tarefaRepository
          .addTarefa(Tarefa(nome: 'Tarefa 1', idGrupo: 0, finalizado: false));

      await _tarefaRepository
          .addTarefa(Tarefa(nome: 'Tarefa 2', idGrupo: 0, finalizado: false));

      await _tarefaRepository
          .addTarefa(Tarefa(nome: 'Tarefa 3', idGrupo: 0, finalizado: false));

      loadListaGrupos();
      print('Database criada');
      databaseCriado = true;
    } catch (e) {
      print('Erro ao criar Database');
      databaseCriado = false;
    }
  }
}
