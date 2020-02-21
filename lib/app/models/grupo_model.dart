import 'package:flutter/material.dart';
import 'package:todo_list/app/shared/consts/tables_dml.dart';

class Grupo {
  int id;
  String nome;
  String cor;

  Grupo({this.id, this.nome, this.cor});

  Grupo.fromJson(Map<String, dynamic> json) {
    this.id = json[TablesDML.gruposId];
    this.nome = json[TablesDML.gruposNome];
    this.cor = json[TablesDML.gruposCor];
  }
}