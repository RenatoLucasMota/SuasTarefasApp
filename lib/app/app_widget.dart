import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Todo Flutter',
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Google',
          cursorColor: Colors.blue,
          indicatorColor: Colors.blue,
          primaryColor: Colors.blue,
          primaryColorDark: Colors.blue,),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
