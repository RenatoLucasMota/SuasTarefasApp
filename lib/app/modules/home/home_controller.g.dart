// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$heroTagAtom = Atom(name: '_HomeControllerBase.heroTag');

  @override
  String get heroTag {
    _$heroTagAtom.context.enforceReadPolicy(_$heroTagAtom);
    _$heroTagAtom.reportObserved();
    return super.heroTag;
  }

  @override
  set heroTag(String value) {
    _$heroTagAtom.context.conditionallyRunInAction(() {
      super.heroTag = value;
      _$heroTagAtom.reportChanged();
    }, _$heroTagAtom, name: '${_$heroTagAtom.name}_set');
  }

  final _$pageIndexAtom = Atom(name: '_HomeControllerBase.pageIndex');

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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setPageIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setPageIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHeroTag(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setHeroTag(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
