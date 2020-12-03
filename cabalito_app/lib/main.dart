import 'package:cabalitoapp/ClassBuilder.dart';
import 'package:cabalitoapp/Menu.dart';
import 'package:cabalitoapp/bloc/bloc/LogInBloc.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';
import 'package:cabalitoapp/repository/MechanicRepository.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import 'package:cabalitoapp/repository/SellerRepository.dart';
import 'package:cabalitoapp/screens/LogIn.dart';
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
      theme: ThemeData(primaryColor: Color.fromRGBO(73, 24, 89, 1),accentColor: Colors.black,fontFamily: "SourceSansPro"),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create:(context)=>LogInBloc(),
          child:BlocBuilder<LogInBloc,LogInBlocState>(
            builder: (context,stateNavigation){
              if(stateNavigation is LogInOkState){
                return BlocProvider(
                    create:(context2)=>NavigationBloc(PublicationRepository(),MechanicRepository(),SellerRepository()),
                    child:Menu());
              }
              else{
                return LogIn();
              }
            },
          )),
    );
  }
}
