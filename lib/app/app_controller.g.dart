// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppBase, Store {
  final _$pageIndexAtom = Atom(name: '_AppBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$grupoAtualAtom = Atom(name: '_AppBase.grupoAtual');

  @override
  Grupo get grupoAtual {
    _$grupoAtualAtom.context.enforceReadPolicy(_$grupoAtualAtom);
    _$grupoAtualAtom.reportObserved();
    return super.grupoAtual;
  }

  @override
  set grupoAtual(Grupo value) {
    _$grupoAtualAtom.context.conditionallyRunInAction(() {
      super.grupoAtual = value;
      _$grupoAtualAtom.reportChanged();
    }, _$grupoAtualAtom, name: '${_$grupoAtualAtom.name}_set');
  }

  final _$databaseCriadoAtom = Atom(name: '_AppBase.databaseCriado');

  @override
  bool get databaseCriado {
    _$databaseCriadoAtom.context.enforceReadPolicy(_$databaseCriadoAtom);
    _$databaseCriadoAtom.reportObserved();
    return super.databaseCriado;
  }

  @override
  set databaseCriado(bool value) {
    _$databaseCriadoAtom.context.conditionallyRunInAction(() {
      super.databaseCriado = value;
      _$databaseCriadoAtom.reportChanged();
    }, _$databaseCriadoAtom, name: '${_$databaseCriadoAtom.name}_set');
  }

  final _$listaTarefasAtom = Atom(name: '_AppBase.listaTarefas');

  @override
  ObservableList<Tarefa> get listaTarefas {
    _$listaTarefasAtom.context.enforceReadPolicy(_$listaTarefasAtom);
    _$listaTarefasAtom.reportObserved();
    return super.listaTarefas;
  }

  @override
  set listaTarefas(ObservableList<Tarefa> value) {
    _$listaTarefasAtom.context.conditionallyRunInAction(() {
      super.listaTarefas = value;
      _$listaTarefasAtom.reportChanged();
    }, _$listaTarefasAtom, name: '${_$listaTarefasAtom.name}_set');
  }

  final _$listaTarefasFinalizadosAtom =
      Atom(name: '_AppBase.listaTarefasFinalizados');

  @override
  ObservableList<Tarefa> get listaTarefasFinalizados {
    _$listaTarefasFinalizadosAtom.context
        .enforceReadPolicy(_$listaTarefasFinalizadosAtom);
    _$listaTarefasFinalizadosAtom.reportObserved();
    return super.listaTarefasFinalizados;
  }

  @override
  set listaTarefasFinalizados(ObservableList<Tarefa> value) {
    _$listaTarefasFinalizadosAtom.context.conditionallyRunInAction(() {
      super.listaTarefasFinalizados = value;
      _$listaTarefasFinalizadosAtom.reportChanged();
    }, _$listaTarefasFinalizadosAtom,
        name: '${_$listaTarefasFinalizadosAtom.name}_set');
  }

  final _$listaGruposAtom = Atom(name: '_AppBase.listaGrupos');

  @override
  ObservableList<Grupo> get listaGrupos {
    _$listaGruposAtom.context.enforceReadPolicy(_$listaGruposAtom);
    _$listaGruposAtom.reportObserved();
    return super.listaGrupos;
  }

  @override
  set listaGrupos(ObservableList<Grupo> value) {
    _$listaGruposAtom.context.conditionallyRunInAction(() {
      super.listaGrupos = value;
      _$listaGruposAtom.reportChanged();
    }, _$listaGruposAtom, name: '${_$listaGruposAtom.name}_set');
  }

  final _$loadListaTarefasAsyncAction = AsyncAction('loadListaTarefas');

  @override
  Future loadListaTarefas() {
    return _$loadListaTarefasAsyncAction.run(() => super.loadListaTarefas());
  }

  final _$loadListaGruposAsyncAction = AsyncAction('loadListaGrupos');

  @override
  Future loadListaGrupos() {
    return _$loadListaGruposAsyncAction.run(() => super.loadListaGrupos());
  }

  final _$initDatabaseAsyncAction = AsyncAction('initDatabase');

  @override
  Future initDatabase() {
    return _$initDatabaseAsyncAction.run(() => super.initDatabase());
  }

  final _$_AppBaseActionController = ActionController(name: '_AppBase');

  @override
  dynamic setPushToPage({int pageIndex}) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.setPushToPage(pageIndex: pageIndex);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGrupoAtual({Grupo grupo}) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.setGrupoAtual(grupo: grupo);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateTarefa({Tarefa terefa}) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.updateTarefa(terefa: terefa);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }
}
