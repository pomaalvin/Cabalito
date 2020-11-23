import 'package:cabalitoapp/Menu.dart';
import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Home.dart';

class SplashScreen extends StatefulWidget{
  @override
  State createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(milliseconds: 5000),(){});
    return true;
  }
  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (BuildContext context) => Home())
    );
  }

  @override
  void initState(){
    super.initState();
    _mockCheckForSession().then(
        (status){
          _navigateToHome();
        }
    );
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: SecondaryColor,
              highlightColor: PrimaryColor,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: size.height*0.5,
                      width: size.width/2,
                      child: Row(
                        children: [
                          Image.asset('assets/logo.png'),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
            Row(
              children: [
                Text(
                  "Cabalito",
                  style: TextStyle(
                      fontSize: 90.0,
                      shadows: <Shadow>[
                        Shadow(
                            blurRadius: 18.0,
                            color: Colors.black87,
                            offset: Offset.fromDirection(120,12)
                        )
                      ]
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}