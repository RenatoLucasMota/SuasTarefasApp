import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/models/grupo_model.dart';

class ItemGrupoWidget extends StatefulWidget {
  final Grupo grupo;

  const ItemGrupoWidget({Key key, this.grupo}) : super(key: key);
  @override
  _ItemGrupoWidgetState createState() => _ItemGrupoWidgetState();
}

class _ItemGrupoWidgetState extends State<ItemGrupoWidget> {
  bool _selecionou = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.get<AppController>().setPushToPage(pageIndex: 1);
        Modular.get<AppController>().setGrupoAtual(grupo: widget.grupo);
      },
      onLongPress: () {
        setState(() {
          _selecionou = true;
        });
      },
      onLongPressEnd: (_) {
        setState(() {
          _selecionou = false;
        });
      },
      child: Padding(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: _selecionou
                    ? [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10)
                      ]
                    : [],
                color: Color.fromARGB(255, 54, 54, 54),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: widget.grupo.nome,
                      child: Text(
                        widget.grupo.nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Realizou ${widget.grupo.nome} de ${widget.grupo.nome}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Row(
                                  children: <Widget>[
                                    /*Expanded(
                                      flex: 5,
                                      child: ProgressBarWidget(
                                          color: widget.grupo.cor,
                                          progress: widget.grupo.finalizadas /
                                              widget.grupo.total),
                                    ),*/
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(6),
      ),
    );
  }
}
