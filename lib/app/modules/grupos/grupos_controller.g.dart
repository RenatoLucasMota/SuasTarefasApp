// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GruposController on _GruposBase, Store {
  final _$animouAtom = Atom(name: '_GruposBase.animou');

  @override
  bool get animou {
    _$animouAtom.context.enforceReadPolicy(_$animouAtom);
    _$animouAtom.reportObserved();
    return super.animou;
  }

  @override
  set animou(bool value) {
    _$animouAtom.context.conditionallyRunInAction(() {
      super.animou = value;
      _$animouAtom.reportChanged();
    }, _$animouAtom, name: '${_$animouAtom.name}_set');
  }

  final _$_GruposBaseActionController = ActionController(name: '_GruposBase');

  @override
  dynamic setAnimou(bool value) {
    final _$actionInfo = _$_GruposBaseActionController.startAction();
    try {
      return super.setAnimou(value);
    } finally {
      _$_GruposBaseActionController.endAction(_$actionInfo);
    }
  }
}
