import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'screens/Template.dart';

class Home extends KFDrawerContent{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(20, 61, 89, 1),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child:
                  MechanicList()
              ),
            ],
          ),
        ),
      ),
    );
  }
}