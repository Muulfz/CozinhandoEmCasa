import 'package:cozinhando_em_casa/screen/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cozinha em Casa',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Home());
  }
}

