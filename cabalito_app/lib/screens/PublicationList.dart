import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;
import 'dart:async';
import 'dart:io';
import 'dart:ui';

class PublicationList extends StatefulWidget{
  List<ListPublication> listPublications;
  List<Color> colors;
  List<Brand> brands;
  List<City> cities;
  Color newColor;
  int numPue;
  Brand newBrand;
  City newCity;
  PublicationList(this.listPublications,this.colors,this.brands,this.cities,this.newColor,this.newCity,this.newBrand,this.numPue);
  @override
  State createState() => _PublicationList(listPublications,colors,brands,cities,newColor,newCity,newBrand,numPue);
}
class _PublicationList extends State<PublicationList>{
  _PublicationList(this.listPublications,this.colors,this.brands,this.cities,this.newColor,this.newCity,this.newBrand,this.numPue);
  List<Color> colors=List();
  List<Brand> brands=List();
  List<City> cities=List();
  List<int> numPuerta=[1,2,3,4,5,6,7,8,9];
  Color newColor;
  int numPue;
  Brand newBrand;
  City newCity;
  List<ListPublication> listPublications=List();
  TextEditingController buscarPublicacion = TextEditingController();
  Future buscar(t) async {
    Completer c = Completer();
    Timer(Duration(milliseconds: t), () {
      c.complete(busquedatiempoReal(t));
    });
  }
  busquedatiempoReal(t) {
    setState(() {
      if(buscarPublicacion.toString()!=""){
      }
      //print("ggg ${buscarPublicacion}");
      buscar(t);
    });
  }
  @override
  void initState(){
    super.initState();
    //buscar(10);
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: color4,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width*0.1,
                          height: size.height*0.03,
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.only(left:size.width*0.03,right:size.width*0.03,bottom: 0.0,top: 0.0),
                          child: Center(
                              child: Busqueda(buscarPublicacion)
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: newBrand==null?Colors.transparent:PrimaryColor,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                  //only(bottomLeft: 1.0, bottomRight: 1.0, topLeft: 1.0, topRight: 1.0),
                                  border: Border.all(color: PrimaryColor ,
                                      width: 1),
                                  //#D4D4D5
                                ),
                                width: size.width*0.22,
                                height: size.height*0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(newBrand==null?"Marca":newBrand.brand,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: newBrand==null?PrimaryColor:color4,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              onTap: ()async {
                                var alert=AlertItemPublication();
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    var brand=await alert.alertBrand(context, brands);
                                    if(brand!=null){
                                      setState(() {
                                        newBrand=brand;
                                      });
                                    }
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: newColor==null?Colors.transparent:PrimaryColor,
                                    border: Border.symmetric( vertical: BorderSide(color: newColor==null||newBrand==null?PrimaryColor:Colors.white, width: 1), horizontal: BorderSide(color: PrimaryColor, width: 1) ),
                                    //#D4D4D5
                                  ),
                                  width: size.width*0.21,
                                  height: size.height*0.05,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(newColor==null?"Color":newColor.color,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: newColor==null?PrimaryColor:color4,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              onTap: ()async {
                                var alert=AlertItemPublication();
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    var color =await alert.alertColor(context, colors);
                                    if(color!=null){
                                      setState(() {
                                        newColor=color;
                                      });
                                    }
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: newCity==null?Colors.transparent:PrimaryColor,
                                    border: Border.symmetric( vertical: BorderSide(color: newCity==null||numPue==null?PrimaryColor:Colors.white, width: 1),horizontal: BorderSide(color: PrimaryColor, width: 1) ),
                                    //#D4D4D5
                                  ),
                                  width: size.width*0.28,
                                  height: size.height*0.05,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(newCity==null?"Ciudad":newCity.city,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: newCity==null?PrimaryColor:color4,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              onTap: ()async {
                                var alert=AlertItemPublication();
                                FocusScope.of(context).requestFocus(new FocusNode());
                                var city=await alert.alertCity(context, cities);
                                if(city!=null){
                                  setState(() {
                                    newCity=city;
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: numPue==null?Colors.transparent:PrimaryColor,
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),
                                    border: Border.all(color: PrimaryColor,
                                        width: 1),
                                    //#D4D4D5
                                  ),
                                  width: size.width*0.22,
                                  height: size.height*0.05,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(numPue==null?"Nº Puerta":numPue.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: numPue==null?PrimaryColor:color4,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              onTap: ()async {
                                var alert=AlertItemPublication();
                                FocusScope.of(context).requestFocus(new FocusNode());
                                var numPuer=await alert.alertNumPuerta(context, numPuerta);
                                if(numPuer!=null){
                                  setState(() {
                                    numPue=numPuer;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width*0.1,
                          height: size.height*0.02,
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ScrollConfiguration(
                                          behavior: MyBehavior(),
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(left: size.width/9 ,right: size.width/9),
                                            itemBuilder: (context,index){
                                              return _ViewPublic(size.width,size.height,listPublications[index]);
                                            },
                                            itemCount: listPublications.length,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget Busqueda(controller){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: PrimaryColor.withOpacity(0.6),width: 2)
      ),
      child: TextField(
        controller: controller,
        cursorColor: PrimaryColor.withOpacity(0.6),
        cursorWidth: 1,
        style: TextStyle(color: color3.withOpacity(0.6),fontSize: 18),
        decoration: InputDecoration(
          fillColor: PrimaryColor,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10,top: 15,bottom: 0,right: 0),
          hintText: "Buscar publicacion",
          suffixIcon: GestureDetector(
            child: Icon(Icons.search,color: PrimaryColor,),
            onTap: () async {
              print("ingrese");
              //listPublication=null;
              setState(() {

                BlocProvider.of<NavigationBloc>(context).add(PublicationSearchEvent(newCity,newColor,newBrand,numPue,buscarPublicacion.text));
              });
            },
          ) ,
          hintStyle: TextStyle(color: PrimaryColor.withOpacity(0.7)),
          // focusColor: Colors.white,
          // labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  listaSearchAct(List<ListPublication> listPublication) {
    listPublications=listPublication;
  }
}


class _ViewPublic extends StatelessWidget{
  KFDrawerController _drawerController;
  var width;
  var height;
  ListPublication listPublication;
  _ViewPublic(this.width, this.height,this.listPublication);
  Widget build(BuildContext context) {
    return
        Container(
          padding: const EdgeInsets.fromLTRB(0,10,0,10),
          width: width,
          height: height*0.23,
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () async {
              BlocProvider.of<NavigationBloc>(context).add(PublicationViewEvent(listPublication.idPublication));
            },
            child: Container(
              width: width,
              height: height*0.1,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: BorderListColor,
                    width: 2),
                //#D4D4D5
              ),
              padding: const EdgeInsets.fromLTRB(10,10,10,10),
              child: Container(
                width: width,
                height: height*0.1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: width*0.32,
                          height: height*0.155,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(api.url+"image/"+listPublication.imagePath),
                              fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width*0.02,
                          height: height*0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width*0.35,
                              height: height*0.05,
                              color: Colors.transparent,
                              child: Text(listPublication.title,
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width*0.35,
                                  height: height*0.05,
                                  color: Colors.transparent,
                                  child: Text("Precio: Bs. ${listPublication.price}",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14.0
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


class AlertItemPublication{
  alertColor(context,List<Color> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Color",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].color),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  alertCity(context,List<City> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(

            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Ciudad",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].city),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  alertBrand(context,List<Brand> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Marca",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].brand),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  alertNumPuerta(context,List<int> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Nº Puertas",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].toString()),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}
