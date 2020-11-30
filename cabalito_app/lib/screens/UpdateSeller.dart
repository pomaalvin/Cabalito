import 'dart:io';
import 'dart:ui';

import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;
class UpdateSeller extends StatefulWidget{
  Seller seller;

  UpdateSeller(this.seller);

  @override
  State createState() => UpdateSellerState(seller);
}

class UpdateSellerState extends State<UpdateSeller>{
  Seller seller;
  UpdateSellerState(this.seller);

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  File imageFile;

  _openGallery(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();


    //this.setState({});
  }
  _openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
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
                                            _decideImageView(),
                                            IconButton(
                                                icon: Icon(Icons.add_a_photo),
                                                iconSize: size.width*0.1,
                                                color: PrimaryColor,

                                                onPressed: () {
                                                  _showChoiceDialog(context);
                                                }),
                                            buildLabel("Nombre: "),
                                            input(name,seller.firstName),
                                            buildLabel("Apellido: "),
                                            input(lastname,seller.lastName),
                                            buildLabel("Telefono: "),
                                            input(phone,seller.phoneNumber),


                                          ],

                                        ),
                                        Row(
                                          children: [
                                            buildButton("Actualizar", PrimaryColor),
                                            buildButton("Cambiar Contraseña", PrimaryColor)
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
  Widget _decideImageView(){
    if(imageFile==null){
      return Container(
          width: size.width*0.5,
          height: size.width*0.5,

          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(api.url+"sellerImage/"+seller.imagePath),
                  ),
            borderRadius: BorderRadius.circular(15.0),
              )

      );
    }else{
      return Image.file(
          imageFile,
          width: size.width*0.5,
          height: size.width*0.5);
    }
  }
  Widget input(TextEditingController controller, String hint){
    return  Padding(
      padding: EdgeInsets.only(top: size.height*0.03, left: size.width*0.05),
      child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),

            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: PrimaryColor),

            ),

          )),
    );

  }
  Widget buildLabel(String textLabel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Padding(
          padding: EdgeInsets.only(top: size.height*0.03, left: size.width*0.05),
          child: Text(textLabel,
          style: TextStyle(
          fontSize: 18.0,
          color: TitleColor,

          ),
          ),
          ),
      ],
    );
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Padding(
      padding: EdgeInsets.only(top: size.height*0.95, left: size.width*0.02,bottom: size.height*0.05),
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
            _buttonAction(context, buttonText);
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
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Seleccione una opción"
        ),
        backgroundColor: SecondaryColor,
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: IconButton(icon: Icon(Icons.add_photo_alternate),iconSize: size.width*0.1,color: PrimaryColor,
                        onPressed: () {
                          _openGallery(context);
                        }),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  GestureDetector(
                    child: IconButton(icon: Icon(Icons.camera_enhance),iconSize: size.width*0.1,color: PrimaryColor,
                        onPressed: () {
                          _openCamera(context);
                        }),
                  ),
                ],
              )

            ],
          ),
        ),
      );
    });
  }
  _buttonAction(context, String option){
    if(option=="Actualizar"){
      _updateSeller(context, seller);
    }
    if(option=="Cambiar Contraseña"){}
  }
  _updateSeller(context,Seller seller){
    if(name.text.isNotEmpty){
      seller.firstName=name.text;
    }
    if(lastname.text.isNotEmpty){
      seller.lastName=lastname.text;
    }
    if(phone.text.isNotEmpty){
      seller.phoneNumber=phone.text;
    }
    bool flag=true;
    if(imageFile==null){
      flag=false;
    }
    BlocProvider.of<NavigationBloc>(context).add(UpdateSellerEvent(seller,imageFile,flag));

  }

}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
