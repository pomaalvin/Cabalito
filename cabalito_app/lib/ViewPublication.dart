import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'lib/Colors.dart';
import 'lib/Colors.dart';

class PublicationView extends KFDrawerContent{
  @override
  State createState() => _ViewPublication();
}

class _ViewPublication extends State<PublicationView>{
  @override
  void initState(){
    super.initState();
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [

        
        ListView(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.grey,
                  width: size.width,
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
              padding: const EdgeInsets.fromLTRB(18,10,18,10),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [

                      Container(

                        color: Colors.transparent,
                        width: size.width*0.90,
                        height: size.height*0.05,
                        child: Text("Publication Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
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
                        width: size.width*0.90,
                        height: size.height*0.1,
                        child: Text("Description",
                          style: TextStyle(
                              color: Colors.black54,
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
                        width: size.width*0.90,
                        height: size.height*0.03,
                        child: Text("Price",
                          style: TextStyle(
                              color: Colors.black,
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
                        width: size.width*0.90,
                        height: size.height*0.06,
                        child: Text("price",
                          style: TextStyle(
                              color: Colors.black54,
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
                                      color: Colors.black,
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
                                      color: Colors.black,
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
                                      color: Colors.black,
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
                                child: Text("Color",
                                  style: TextStyle(
                                      color: Colors.black,
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
                                      color: Colors.black54,
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
                                      color: Colors.black54,
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
                                      color: Colors.black54,
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
                                child: Text("color",
                                  style: TextStyle(
                                      color: Colors.black54,
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
                                width: size.width*0.675,
                                height: size.height*0.03,
                                child: Text("D. Number",
                                  style: TextStyle(
                                      color: Colors.black,
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
                                      color: Colors.black,
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
                                width: size.width*0.675,
                                height: size.height*0.03,
                                child: Text("d. number",
                                  style: TextStyle(
                                      color: Colors.black54,
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
                                      color: Colors.black54,
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
            Row(
              children: [
                Container(
                  color: PrimaryColor,
                  width: size.width,
                  height: size.height*0.1,
                )
              ],
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