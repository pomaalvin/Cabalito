
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../lib/Colors.dart';

class UpdateSeller extends StatefulWidget{
  @override
  State createState() => UpdateSellerState();
}

class UpdateSellerState extends State<UpdateSeller>{
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  File imageFile;
  _openGallery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile=picture;
    });


    //this.setState({});
  }
  _openCamera() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile=picture;
    });
  }



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
                                                    )
                                                )
                                            ),
                                            RaisedButton(color:PrimaryColor,onPressed: (){
                                              _showChoiceDialog(context);
                                            },child: Text("Seleccione una imagen", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0
                                            )
                                            )
                                            ),
                                            buildLabel("Nombre: "),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10, left: 1),
                                              child: TextField(controller: name,
                                                  style: TextStyle(fontSize: 15),
                                                  decoration: InputDecoration(hintStyle: TextStyle(
                                                      color: Colors.white
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
                                            buildButton("Actualizar", PrimaryColor)
                                          ],
                                        )
                                      ],
                                    ),
                                  );
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
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Seleccione una opción"
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text("Galeria"),
                onTap: (){
                  _openGallery();
                },
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              GestureDetector(
                child: Text("Camera"
                ),
                onTap: (){
                  _openCamera();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
