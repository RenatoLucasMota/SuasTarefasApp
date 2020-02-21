import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:todo_list/app/app_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  MultiTrackTween _multiTrackTween;
  ReactionDisposer disposer;
  @override
  void initState() { 
    super.initState();
    final controller = Modular.get<AppController>();
    controller.initDatabase();
    _multiTrackTween = MultiTrackTween([
      Track("padding").add(
          Duration(milliseconds: 600), Tween<double>(begin: 300.0, end: 0.0),
          curve: Curves.easeInOutCubic),
      Track("opacity").add(
          Duration(milliseconds: 800), Tween<double>(begin: 0, end: 1),
          curve: Curves.easeInOutCubic),
    ]);

    disposer = autorun((_) {
      if (controller.databaseCriado) {
        Modular.to.pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      body: Center(
        child: ControlledAnimation(
          playback: Playback.PLAY_FORWARD,
          duration: _multiTrackTween.duration,
          tween: _multiTrackTween,
          builder: (context, animation) {
            return Padding(
              padding: EdgeInsets.only(top: animation['padding']),
              child: Opacity(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Suas',
                          style: TextStyle(fontSize: 42, color: Colors.blue),
                        ),
                        Text(
                          ' Tarefas',
                          style: TextStyle(fontSize: 42),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 68.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'By Renato Mota',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                opacity: animation['opacity'],
              ),
            );
          },
        ),
      ),
    );
  }
}
