import 'package:cabalitoapp/ClassBuilder.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/Menu.dart';
import 'package:flutter/material.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cabalito App',
      theme: ThemeData(primaryColor: Color.fromRGBO(73, 24, 89, 1),accentColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}
