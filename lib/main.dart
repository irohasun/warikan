import 'package:flutter/material.dart';
import 'package:warikan_app/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '割り勘感',
      debugShowCheckedModeBanner: false,//Debugを表示をOFF
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


