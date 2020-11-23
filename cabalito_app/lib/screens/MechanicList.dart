import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/Stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MechanicList extends StatefulWidget{
  List<Mechanic> mechList;
  MechanicList(this.mechList);
  @override
  State createState() => MechanicListState(mechList);
}
class MechanicListState extends State<MechanicList>{
  List<Mechanic> mechList;
  MechanicListState(this.mechList);

  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return new Scaffold(
        backgroundColor: color4,
        body: Column(
          children: <Widget>[
            Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height*0.040,
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: size.width*0.07 ,right: size.width*0.07),
                          itemBuilder: (context,index){
                            return _Card(size.width,size.height,mechList[index]);
                          },
                          itemCount: mechList.length,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        )
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

class _Card extends StatelessWidget{

  Mechanic mechanic;
  var widhtScreen;
  var heightScreen;

  _Card(this.widhtScreen, this.heightScreen,this.mechanic);

  Color color= PrimaryColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        showDialog(context: context, builder:(contex) => MechanicCall(
            mechanic.shopName,
            mechanic.shopPhoneNumber,
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        height: heightScreen*0.125,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: BorderListColor),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: heightScreen*0.025,left: widhtScreen*0.055),
                      child: Text(mechanic.shopName,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: TitleColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: heightScreen*0.018,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: widhtScreen*0.055+2),
                      child: Text(mechanic.location,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: SubtitleColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.only(top:heightScreen*0.025,right: widhtScreen*0.055-3),
                        child:
                        Estrellas(mechanic.stars)
                    )
                  ],
                ),
                SizedBox(
                  height: heightScreen*0.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: widhtScreen/17),
                      child:
                        Puntuacion(mechanic.idMechanic,mechanic.shopName),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Estrellas extends StatelessWidget{
  int estrellas;
  Estrellas(this.estrellas);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            if(estrellas>=index+1){

              return
                Icon(Icons.star,color: SecondaryColor,size: 20,);
            }
            else{

              return
                Icon(Icons.star_border,color: SecondaryColor,size: 20,);
            }
          })
      ),
    );
  }
}

class Puntuacion extends StatelessWidget{
  var idMechanic;
  var shopName;

  Puntuacion(this.idMechanic,this.shopName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height*0.03,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(5)
            ),
            child: FlatButton(
              child: Text(
                "Valorar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
              onPressed: ()async{
                int option=await
                showDialog(context: context, builder:(context) => ValorateMechanic(idMechanic,shopName));
                _addQualification(context,option);
              },
            )
          )
        ],
      ),
    );
  }
  _addQualification(context,option){
    Stars stars=Stars();
    stars.idUser=1;//TODO Modify whit user token
    stars.idMechanic=idMechanic;
    stars.score=option;
    print("ok");
    BlocProvider.of<NavigationBloc>(context).add(AddQualificationEvent(stars));
  }
}

class ValorateMechanic extends StatelessWidget{
  var idMechanic;
  var shopName;
  var puntuation;
  ValorateMechanic(this.idMechanic,this.shopName);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContentValorate(context),
    );
  }
  dialogContentValorate(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100,bottom: 16,left: 16,right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: color4,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shopName,
                    style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    itemCount: 5,
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemBuilder: (context, _)=>Icon(
                      Icons.star,
                      color: SecondaryColor,
                    ),
                    onRatingUpdate: (rating){
                      puntuation=rating;
                      print(rating);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(0),
                    height: MediaQuery.of(context).size.height*0.03,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: FlatButton(
                      child: Text(
                        "Confirmar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                      onPressed: (){
                        Navigator.pop(context,puntuation.toInt());
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: color4,
            radius: 50,
            backgroundImage: AssetImage('assets/star.gif'),
          ),
        ),
      ],
    );
  }
}

class MechanicCall extends StatelessWidget{
  var shopName;
  var phone;

  MechanicCall(this.shopName, this.phone);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100,bottom: 16,left: 16,right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: SecondaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0),
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shopName,
                    style: TextStyle(
                      color: TitleColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Telefono:   ",
                        style: TextStyle(
                          color: TitleColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        phone,
                        style: TextStyle(
                          color: TitleColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: PrimaryColor,
            radius: 50,
            child: IconButton(
              onPressed: () async{
                FlutterPhoneDirectCaller.callNumber(phone);
              },
              splashColor: SubtitleColor,
              icon: Icon(
                Icons.phone,
              ),
              iconSize: 40.0,
              color: Color.fromRGBO(33, 186, 69, 1),
              tooltip: "Abrir Telefono",
            ),
          ),
        ),
      ],
    );
  }
}
