import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/models/grupo_model.dart';
import 'package:todo_list/app/models/tarefa_model.dart';
import 'package:todo_list/app/modules/tarefa/widgets/item_tarefa_widget.dart';

class TarefaPage extends StatefulWidget {
  final String title;
  const TarefaPage({Key key, this.title = "Tarefa"}) : super(key: key);

  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  MultiTrackTween _multiTrackTween;
  bool inseriuFinalizados;
  @override
  void initState() {
    super.initState();
    Modular.get<AppController>().loadListaTarefas();
    _multiTrackTween = MultiTrackTween([
      Track("padding").add(
          Duration(milliseconds: 800), Tween<double>(begin: 100.0, end: 40.0),
          curve: Curves.easeInOutCubic),
      Track("opacity").add(
          Duration(milliseconds: 900), Tween<double>(begin: 0, end: 1),
          curve: Curves.easeInOutCubic),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ControlledAnimation(
              playback: Playback.PLAY_FORWARD,
              duration: _multiTrackTween.duration,
              tween: _multiTrackTween,
              builder: (context, animation) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 60, left: animation['padding'], right: 40),
                  child: Opacity(
                    opacity: animation['opacity'],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Observer(
                                  name: 'titulo',
                                  builder: (context) {
                                    return Text(
                                      Modular.get<AppController>()
                                          .grupoAtual
                                          .nome,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey[200],
                                      ),
                                    );
                                  }),
                            ),
                            PopupMenuButton<int>(
                              onSelected: (id) async {
                                Modular.get<AppController>().setGrupoAtual(
                                    grupo: await Modular.get<AppController>()
                                        .getGrupo(id: id));
                                Modular.get<AppController>().loadListaTarefas();
                              },
                              icon: Icon(Feather.chevron_down),
                              itemBuilder: (context) =>
                                  Modular.get<AppController>()
                                      .listaGrupos
                                      .map((grupos) {
                                return PopupMenuItem(
                                  value: grupos.id,
                                  child: Text(grupos.nome),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Observer(
                          name: 'progressbar',
                          builder: (context) {
                            Grupo grupoAtual =
                                Modular.get<AppController>().grupoAtual;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*ProgressBarWidget(
                                    progress: grupoAtual.finalizadas /
                                        grupoAtual.total,
                                    color: grupoAtual.cor,
                                  ),*/
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Realizou ${grupoAtual.nome} de ${grupoAtual.nome}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Observer(
                  name: 'lista',
                  builder: (BuildContext context) {
                    inseriuFinalizados = false;
                    List<Tarefa> list =
                        Modular.get<AppController>().listaTarefas;
                    /*List<Tarefa> listFinalizados =
                        Modular.get<AppController>().listaTarefasFinalizados;*/
                    //list.addAll(listFinalizados);
                    return list != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (list[index].finalizado) {
                                      inseriuFinalizados = true;
                                    }
                                    return AnimationConfiguration.staggeredList(
                                      duration: Duration(milliseconds: 800),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: list[index].finalizado == false
                                            ? ItemTarefaWidget(
                                                tarefa: list[index],
                                              )
                                            : Column(
                                                children: <Widget>[
                                                  Container(
                                                      height: 50,
                                                      child:
                                                          Text('Finalizados')),
                                                  ItemTarefaWidget(
                                                    tarefa: list[index],
                                                  )
                                                ],
                                              ),
                                      ),
                                      position: index,
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
