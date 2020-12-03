import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreenView extends StatefulWidget{
  @override
  State createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return /*SplashScreen(
      seconds: 1,
      backgroundColor: PrimaryColor,
      image: Image.asset('assets/logo.png'),
      loaderColor: SecondaryColor,
      photoSize: 110.0,
      navigateAfterSeconds: "",

    );*/
    Scaffold(
      backgroundColor: PrimaryColor,
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
               margin: EdgeInsets.symmetric(horizontal: size.width*0.2),
               height: size.height*0.2,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/logo.png'),
                   fit: BoxFit.fill
                 )
               ),
              ),
              CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(color4),
            ),],
          )
      )
      );
  }
}