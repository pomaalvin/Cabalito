import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Colors.dart';

class Seller extends StatefulWidget{
  @override
  State createState() => SellerState();
}

class SellerState extends State<Seller>{
  @override
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
                  child:Text("Contacto",
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
                                itemCount: 1,
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
  Size size;
  var widhtScreen;
  var heightScreen;

  _Card(this.widhtScreen, this.heightScreen);

  Color color= PrimaryColor;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: BorderListColor),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: size.width*0.5,
                  height: size.width*0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://sa.uia.ac.cr/images/customers-icon-3.png"
                          )
                      )
                  )
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Nombre: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Silvana",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Munoz",
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
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Telefono: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("15963255",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Email: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 5),
                    child: Text("Silvana@gmail.com",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
