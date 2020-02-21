import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/modules/grupos/grupos_controller.dart';
import 'package:todo_list/app/modules/grupos/widgets/list_grupo_widget.dart';

class GruposPage extends StatefulWidget {
  final String title;
  const GruposPage({
    Key key,
    this.title = "Grupos",
  }) : super(key: key);

  @override
  _GruposPageState createState() => _GruposPageState();
}

class _GruposPageState extends State<GruposPage> {
  MultiTrackTween _multiTrackTween;

  @override
  void initState() {
    super.initState();
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
  void dispose() {
    //Modular.get<GruposController>().setAnimou(true);
    super.dispose();
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
                      top: 60,
                      left: Modular.get<GruposController>().animou == false
                          ? animation['padding']
                          : 40,
                      right: 40),
                  child: Opacity(
                    opacity: Modular.get<GruposController>().animou == false
                        ? animation['opacity']
                        : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Grupos de Tarefas',
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: ListGrupoWidget(
                    
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
