import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/models/tarefa_model.dart';

class ItemTarefaWidget extends StatefulWidget {
  final Tarefa tarefa;

  const ItemTarefaWidget({Key key, this.tarefa}) : super(key: key);
  @override
  _ItemTarefaWidgetState createState() => _ItemTarefaWidgetState();
}

class _ItemTarefaWidgetState extends State<ItemTarefaWidget> {
  updateItemRefreshList() {
    Modular.get<AppController>().updateTarefa(terefa: widget.tarefa);
    Modular.get<AppController>().loadListaTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: widget.tarefa.finalizado == true ? false : true,
      onTap: () {
        setState(() {
          widget.tarefa.finalizado = !widget.tarefa.finalizado;
          updateItemRefreshList();
        });
      },
      leading: IconButton(
        icon: widget.tarefa.finalizado == false
            ? Icon(Feather.circle)
            : Icon(Feather.check_circle),
        onPressed: () {
          setState(() {
            widget.tarefa.finalizado = !widget.tarefa.finalizado;
            updateItemRefreshList();
          });
        },
      ),
      title: Text(
        widget.tarefa.nome,
        style: TextStyle(
            decoration:
                widget.tarefa.finalizado ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
