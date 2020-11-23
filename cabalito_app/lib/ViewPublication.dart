import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'lib/Colors.dart';

class PublicationView extends KFDrawerContent{
  @override
  State createState() => _ViewPublication();
}

class _ViewPublication extends State<PublicationView>{
  var widhtScreen;
  var heightScreen;

  @override
  void initState(){
    super.initState();
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: PrimaryColor,
      backgroundColor: color4,
      body: Stack(
        children: [


        ListView(
          children: [
            SizedBox(
              width: size.width*0.01,
              height: size.height*0.005,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width*0.01,
                  height: size.height*0.003,
                ),
                Container(
                  color: Colors.grey,
                  width: size.width*0.98,
                  height: size.height*0.5,

                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width*0.001,
                  height: size.height*0.003,
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(18,10,16,10),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                color: color4,
              ),
              child: Column(
                children: [
                  Row(
                    children: [

                      Container(

                        color: Colors.transparent,
                        width: size.width*0.88,
                        height: size.height*0.05,
                        child: Text("Publication Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color3,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.01,
                        height: size.height*0.01,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: size.width*0.88,
                        height: size.height*0.1,
                        child: Text("Description",
                          style: TextStyle(
                              color: Texto2Color,
                              fontSize: 15.0
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: size.width*0.88,
                        height: size.height*0.03,
                        child: Text("Price",
                          style: TextStyle(
                              color: color3,
                              fontSize: 15.0
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.01,
                        height: size.height*0.01,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: size.width*0.88,
                        height: size.height*0.06,
                        child: Text("price",
                          style: TextStyle(
                              color: Texto2Color,
                              fontSize: 15.0
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [

                      Row(
                        children: [

                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("Brand",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("Model",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("Plate",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.205,
                                height: size.height*0.03,
                                child: Text("Color",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.01,
                        height: size.height*0.01,
                      )
                    ],
                  ),


                  Row(
                    children: [

                      Row(
                        children: [

                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("brand",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("model",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("plate",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.205,
                                height: size.height*0.03,
                                child: Text("color",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.01,
                        height: size.height*0.04,
                      )
                    ],
                  ),
                  Row(
                    children: [

                      Row(
                        children: [

                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.655,
                                height: size.height*0.03,
                                child: Text("D. Number",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.03,
                                child: Text("Motor",
                                  style: TextStyle(
                                      color: color3,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.01,
                        height: size.height*0.01,
                      )
                    ],
                  ),
                  Row(
                    children: [

                      Row(
                        children: [

                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.655,
                                height: size.height*0.03,
                                child: Text("d. number",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Container(
                                color: Colors.transparent,
                                width: size.width*0.225,
                                height: size.height*0.04,
                                child: Text("Motor",
                                  style: TextStyle(
                                      color: Texto2Color,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                color: PrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(

                        color: Colors.transparent,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onPanDown: (dt) async{
                                    FlutterPhoneDirectCaller.callNumber("78787878");
                                    //print("boton");
                                  },
                                  child: Container(

                                    width: size.width*0.98,
                                    height: size.height*0.1,
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Contactar",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: color4,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),

                                )
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),
          ],
        ),

          Material(
            shadowColor: Colors.transparent,
            //color: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: widget.onMenuPressed,
            ),
          ),
        ],
      ),
    );
  }
}
//omprecet