import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../lib/Colors.dart';
import '../model/PublicationView.dart';
import '../lib/ApiUrl.dart' as api;

class PublicationsView extends KFDrawerContent{
  List<PublicationView> publication;
  List<ListPublication> publicationPaths;
  PublicationsView(this.publication, this.publicationPaths);

  @override
  State createState() => _ViewPublications(publication,publicationPaths);
}

class _ViewPublications extends State<PublicationsView>{
  List<PublicationView> publicationView = List();
  List<ListPublication> publicationPaths = List();
  _ViewPublications(this.publicationView,this.publicationPaths);
  List<String> images = List();

  int val=0;
  @override
  void initState(){
    super.initState();
    for(int i=0;i<publicationPaths.length;i++) {
      images.add(api.url+"image/"+publicationPaths[i].imagePath);
    }

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
            Row(
              children: [
                SizedBox(
                  width: size.width*0.01,
                  height: size.height*0.003,
                ),
                Container(
                  color: Colors.white,
                  width: size.width*0.98,
                  height: size.height*0.5,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 280.0,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,

                    ),

                    items: images.asMap().entries.map((ind) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                             // height: size.height*0.2,

                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.transparent),
                              child:
                                    GestureDetector(

                                      //onHorizontalDragEnd: (dt) {

                                        //val=ind.key;
                                        //print("ggg1 ${val}");
                                      //},
                                      child: Image.network( ind.value ,fit: BoxFit.fill),
                                      onPanEnd: (dt){
                                        setState(() {
                                          val=ind.key;
                                        });
                                      },
                                      onPanDown: (dt){
                                        setState(() {
                                          val=ind.key;
                                        });
                                      },
                                    ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: images.length>1?SelectedPhoto(images.length,val):Container(),
                ),
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
                        child: Text(publicationView[0].title,
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
                        child: Text(publicationView[0].title,
                          style: TextStyle(
                              //color: Texto2Color,
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
                        child: Text("Precio",
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
                        child: Text("${publicationView[0].price}",
                          style: TextStyle(
                              //color: Texto2Color,
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
                                child: Text("Marca",
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
                                child: Text("Modelo",
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
                                child: Text("Placa",
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
                                child: Text("${publicationView[0].brand}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                child: Text("${publicationView[0].model}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                child: Text("${publicationView[0].licensePlate}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                child: Text("${publicationView[0].Color}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                child: Text("Puertas",
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
                                child: Text("${publicationView[0].phoneNumber}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                child: Text("${publicationView[0].motor}",
                                  style: TextStyle(
                                      //color: Texto2Color,
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
                                    FlutterPhoneDirectCaller.callNumber("${publicationView[0].phoneNumber}");
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

        ],
      ),
    );
  }
}






class SelectedPhoto extends StatelessWidget{
  final int numberofDots;
  final int phoneIndex;
  SelectedPhoto(this.numberofDots,this.phoneIndex);
  Widget _inactivePath(){
    return new Container(
      child: new Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.0)
          ),
        ),

      ),
    );
  }
  Widget _activePath(){
    return new Container(
      child: new Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.0,
                    blurRadius: 2.0
                )
              ]
          ),
        ),

      ),

    );
  }

  List<Widget> _buildDots(){
    List<Widget> docs = [];
    for(int i=0;i<numberofDots;i++){
      docs.add(
          i==phoneIndex?_activePath():_inactivePath()
      );
    }
    return docs;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }

}

