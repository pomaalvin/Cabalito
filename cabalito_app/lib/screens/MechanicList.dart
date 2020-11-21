import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MechanicList extends StatefulWidget{
  @override
  State createState() => MechanicListState();
}
class MechanicListState extends State<MechanicList>{
  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return new Scaffold(
        backgroundColor: PrimaryColor,
        body: Column(
          children: <Widget>[
            Container(
              height:60,
              child: Center(
                child:
                Container(
                  child:Text("Mecánicos",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: SecondaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.only(top: 6.0),
                      padding: new EdgeInsets.only(top:25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                  padding: EdgeInsets.only(left: 50.0 ,right:50.0),
                                  itemBuilder: (context,index){
                                    return _Card(size.width,size.height);
                                  },
                                  itemCount: 20,
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

  var widhtScreen;
  var heightScreen;

  _Card(this.widhtScreen, this.heightScreen);

  Color color= PrimaryColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        showDialog(context: context, builder:(contex) => MechanicCall(
            "shopName",
            "70628525",
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
                      padding: EdgeInsets.only(top: 20,left: 20),
                      child: Text("Shop Name",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: TitleColor,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 22),
                      child: Text("Location",
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
                  children: [
                    Puntuacion(4)
                  ],
                ),
                Row(
                  children: [
                    Estrellas(((10/5)+1%5).floor())
                  ],
                )
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
      padding: EdgeInsets.only(left: 141,top: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
  int puntuacion;
  Puntuacion(this.puntuacion);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 208,top: 20),
      child: Row(
        children: [
          Icon(Icons.star,color: SecondaryColor,size: 20),
          Text("$puntuacion",
            style: TextStyle(
                fontSize: 15,
                color: PrimaryColor
            ),
          ),
        ],
      ),
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