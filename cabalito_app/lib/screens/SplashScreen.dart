import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/model/PublicationView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';

import '../Home.dart';

class SplashScreenView extends StatefulWidget{
  @override
  State createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('assets/logo.png'),
      loaderColor: PrimaryColor,
      photoSize: 150.0,
    );
  }
}