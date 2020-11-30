
import 'dart:ui';

import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../lib/Colors.dart';

class RegisterSeller extends StatefulWidget{
  @override
  State createState() => RegisterSellerState();
}

class RegisterSellerState extends State<RegisterSeller>{

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return new Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[

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
                                            Container(
                                                width: size.width*0.5,
                                                height: size.width*0.5,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          "https://sa.uia.ac.cr/images/customers-icon-3.png"
                                                      )
                                                  ),
                                                )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10, left: 1),
                                              child: TextField(controller: name,
                                                  style: TextStyle(fontSize: 15),
                                                  decoration: InputDecoration(hintStyle: TextStyle(
                                                      color: Colors.black
                                                  ),
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey),

                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: PrimaryColor),
                                                      ),
                                                      hintText: "Nombre"
                                                  )
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10, left: 1),
                                                child: TextField(controller: lastname,
                                                    style: TextStyle(fontSize: 15),
                                                    decoration: InputDecoration(hintStyle: TextStyle(
                                                        color: Colors.black
                                                    ),
                                                        enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.grey),

                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: PrimaryColor),

                                                        ),
                                                        hintText: "Apellido"
                                                    ))
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10, left: 1),
                                                child: TextField(controller: phone,
                                                    style: TextStyle(fontSize: 15),decoration: InputDecoration(hintStyle: TextStyle(
                                                        color: Colors.black
                                                    ),enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey),

                                                    ),
                                                        focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: PrimaryColor),

                                                        ),
                                                        hintText: "Telefono"
                                                    ))
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10, left: 1),
                                                child: TextField(controller: email,
                                                    style: TextStyle(fontSize: 15),
                                                    keyboardType:TextInputType.emailAddress,
                                                    decoration: InputDecoration(hintStyle: TextStyle(
                                                        color: Colors.black
                                                    ),
                                                        enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.grey),

                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: PrimaryColor),

                                                        ),
                                                        hintText: "Email"
                                                    ))
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10, left: 1),
                                                child: TextField(controller: confirmPassword,
                                                    style: TextStyle(fontSize: 15),
                                                    obscureText: true,
                                                    decoration: InputDecoration(hintStyle: TextStyle(
                                                        color: Colors.black
                                                    ),
                                                        enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.grey),

                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: PrimaryColor),

                                                        ),
                                                        hintText: "Contraseña"
                                                    ))
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10, left: 1),
                                                child: TextField(controller: password,
                                                    obscureText: true,
                                                    style: TextStyle(fontSize: 15),decoration: InputDecoration(hintStyle: TextStyle(
                                                        color: Colors.black
                                                    ),
                                                        hintText: "Confirmar contraseña"
                                                    ))
                                            ),
                                            buildButton("Registrar", PrimaryColor)
                                          ],
                                        )
                                      ],
                                    ),
                                  );;
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
            borderRadius: BorderRadius.all(Radius.circular(60.0)),
          ),
          onPressed: (){
            _addSeller(context);
          },
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

  _addSeller(context){
    Seller seller=Seller();
    seller.firstName=name.text;
    seller.lastName=lastname.text;
    seller.phoneNumber=phone.text;
    seller.email=email.text;
    seller.password=password.text;
    seller.imagePath="imageSeller/1Fj7u55XIZ7rTip4Obtt.png";
    if(password.text==confirmPassword.text) {
      BlocProvider.of<NavigationBloc>(context).add(AddSellerEvent(seller));
      }

  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


