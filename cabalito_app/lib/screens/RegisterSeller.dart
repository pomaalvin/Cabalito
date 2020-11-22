import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Colors.dart';

class RegisterSeller extends StatefulWidget{
  @override
  State createState() => RegisterSellerState();
}

class RegisterSellerState extends State<RegisterSeller>{
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
                  child:Text("Registro",
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

class _Card extends StatelessWidget {


  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Size size;
  var widhtScreen;
  var heightScreen;

  _Card(this.widhtScreen, this.heightScreen);

  Color color = Color.fromRGBO(20, 61, 89, 1);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: BorderListColor),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              buildLabel("Nombre: "),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 1),
                child: TextField(controller: name,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(hintStyle: TextStyle(
                        color: Colors.black
                    ))),
              ),
              buildLabel("Apellido: "),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 1),
                  child: TextField(controller: lastname,
                    style: TextStyle(fontSize: 15),)
              ),
              buildLabel("Telefono: "),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 1),
                  child: TextField(controller: phone,
                    style: TextStyle(fontSize: 15),)
              ),
              buildLabel("Email: "),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 1),
                  child: TextField(controller: email,
                    style: TextStyle(fontSize: 15),)
              ),
              buildLabel("Contraseña"),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 1),
                  child: TextField(controller: confirmPassword,
                    style: TextStyle(fontSize: 15),)
              ),
              buildLabel("Confirmar Contraseña"),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 1),
                  child: TextField(controller: password,
                    style: TextStyle(fontSize: 15),)
              ),
              buildButton("Registrar", PrimaryColor)
            ],
          )
        ],
      ),
    );
  }

  Widget buildLabel(String textLabel) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 5),
      child: Text(textLabel,
        style: TextStyle(
          fontSize: 18.0,
          color: TitleColor,
        ),
      ),
    );
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 5),
      child: Container(
        color: buttonColor,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
            ),
          ),
        ),
      ),
    );
  }
}