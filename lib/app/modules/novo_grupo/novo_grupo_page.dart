import 'package:flutter/material.dart';

class NovoGrupoPage extends StatefulWidget {
  
  final String title;
  const NovoGrupoPage({Key key, this.title = "NovoGrupo"}) : super(key: key);

  @override
  _NovoGrupoPageState createState() => _NovoGrupoPageState();
}

class _NovoGrupoPageState extends State<NovoGrupoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
  