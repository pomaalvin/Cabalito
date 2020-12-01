import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreenView extends StatefulWidget{
  @override
  State createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: PrimaryColor,
      image: Image.asset('assets/logo.png'),
      loaderColor: SecondaryColor,
      photoSize: 110.0,
    );
  }
}