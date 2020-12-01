import 'package:cabalitoapp/ClassBuilder.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/repository/MechanicRepository.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import 'package:cabalitoapp/repository/SellerRepository.dart';
import 'package:cabalitoapp/screens/LogIn.dart';
import 'package:cabalitoapp/screens/SplashScreen.dart';
import 'package:cabalitoapp/screens/Template.dart';
import 'package:cabalitoapp/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
          create:(context2)=>NavigationBloc(PublicationRepository(),MechanicRepository(),SellerRepository()),
          child: LogIn()),
    );
  }
}
