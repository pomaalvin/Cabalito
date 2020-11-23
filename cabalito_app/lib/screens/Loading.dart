
import 'dart:io';

import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Container(
        color: color4.withOpacity(0.5),
        child:  Center(
          child: Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(PrimaryColor),
            ),
          ),
        ),
      ),
    );
  }

}