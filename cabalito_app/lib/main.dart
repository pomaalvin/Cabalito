import 'package:cabalitoapp/ClassBuilder.dart';
import 'package:cabalitoapp/Menu.dart';
import 'package:cabalitoapp/bloc/bloc/LogInBloc.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';
import 'package:cabalitoapp/repository/MechanicRepository.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import 'package:cabalitoapp/repository/SellerRepository.dart';
import 'package:cabalitoapp/screens/SplashScreen.dart';
import 'package:cabalitoapp/screensLogin/LogIn.dart';
import 'package:cabalitoapp/screensLogin/RegisterSeller.dart';
import 'package:cabalitoapp/screensLogin/SignUp.dart';
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
          create:(context)=>LogInBloc(SellerRepository())..add(InitAppEvent()),
          child:BlocBuilder<LogInBloc,LogInBlocState>(
            builder: (context,stateNavigation){
              if(stateNavigation is LogInOkState){
                print(context);
                return BlocProvider(
                    create:(context2)=>NavigationBloc(PublicationRepository(),MechanicRepository(),SellerRepository())..add(HomePageEvent()),
                    child:Menu());
              }
              else if(stateNavigation is SignUpState||stateNavigation is SignUpLoadingState){
                return SignUp();
              }
              else if (stateNavigation is InitLoginState){
                return SplashScreenView();
              }
              else{
                return LogIn();
              }
            },
          )
      ),
    );
  }
}
