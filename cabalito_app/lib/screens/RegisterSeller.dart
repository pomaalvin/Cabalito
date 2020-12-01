
import 'dart:ui';

import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;
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
      backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                      margin: new EdgeInsets.only(top: size.height*0.03),
                      //padding: new EdgeInsets.only(top: size.height*0.05),
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: size.width*0.1 ,right: size.width*0.1),
                                itemBuilder: (context,index){
                                  return Container(
                                    child: Stack(
                                      children: [
                                        Column(

                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(top: size.height*0.02, left: size.width*0.05),
                                                  width: size.width*0.5,
                                                  height: size.width*0.5,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 4, color: PrimaryColor),
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/user.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  )
                                              ),
                                            input(name,"Nombre"),
                                            input(lastname,"Apellido"),
                                            input(phone,"Teléfono"),
                                            input(email,"Email"),
                                            input(password,"Contraseña"),
                                            input(confirmPassword,"Confirmar contraseña"),
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
  Widget input(TextEditingController controller, String hint){
    return Container(
      padding: EdgeInsets.only(top: size.height*0.05, left: size.width*0.05),
      width: size.width*0.75,

      child: TextField(controller: controller,
          cursorWidth: 1,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(hintStyle: TextStyle(
              color: Colors.grey
              ),
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),

              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor),

              ),
              hintText: hint,


            //  borderRadius: BorderRadius.circular(15.0),
            )

          )
      );

  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Padding(
      padding: EdgeInsets.only(top: size.height*0.05, left: size.width*0.02,bottom: size.height*0.05),
      child: Container(
        width: size.width*0.35,
        height: size.height*0.08,
        child: RaisedButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: buttonColor,
          highlightElevation: 10.0,
          disabledColor: BorderListColor,
          onPressed: (){
            _addSeller(context);
          },
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
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
    seller.imagePath="vacio";
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


