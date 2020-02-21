// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioController on _CalendarioBase, Store {
  final _$valueAtom = Atom(name: '_CalendarioBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_CalendarioBaseActionController =
      ActionController(name: '_CalendarioBase');

  @override
  void increment() {
    final _$actionInfo = _$_CalendarioBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CalendarioBaseActionController.endAction(_$actionInfo);
    }
  }
}
