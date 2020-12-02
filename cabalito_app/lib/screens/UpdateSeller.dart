
import 'dart:io';
import 'dart:ui';
import 'package:toast/toast.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
  UpdateSellerState(this.seller){
    print(seller);
  }

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
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
                      margin: new EdgeInsets.only(top: size.height*0.03),
                      padding: new EdgeInsets.only(top:size.height*0.01),
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
                                padding: EdgeInsets.only(left: size.width*0.1 ,right:size.width*0.1),
                                itemBuilder: (context,index){
                                  return Container(
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
                                            input(name,"Nombre: "+seller.firstName,true),

                                            input(lastname,"Apellido: "+seller.lastName,true),

                                            input(phone,"Telefono: "+seller.phoneNumber,true),
                                            Container(
                                              height: size.height*0.03,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                buildButton("Actualizar", PrimaryColor),
                                                buildButton("Cambiar Contraseña", PrimaryColor)
                                              ],
                                            )
                                          ],
                                        ),


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
            border: Border.all(width: 4, color: PrimaryColor),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: seller.imagePath=="vacio"?(AssetImage("assets/user.png")):(NetworkImage(api.url+"sellerImage/"+seller.imagePath)),
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
  Widget input(TextEditingController controller, String hint, bool flag){
    return  Padding(

      padding: EdgeInsets.only(top: size.height*0.015, left: size.width*0.05,   right: size.width*0.05),
      child: TextField(

          controller: controller,
          obscureText: flag,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
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

  Widget buildButton(String buttonText, Color buttonColor) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.02),
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
            textAlign: TextAlign.center,
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
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),

        ),
        backgroundColor: SecondaryColor,
        child: Container(
          height: size.height*0.2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(size.height*0.03),
                height: size.height*0.09,
                width: size.width,

                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                ),
                child: Text("Seleccione opción:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                      //backgroundColor: PrimaryColor
                  ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
  Future<void> _changePassword(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),

        ),
        child: Container(
          height: size.height*0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Column(
                children: [
                      Container(
                        padding: EdgeInsets.all(size.height*0.03),
                        height: size.height*0.09,
                        width: size.width,

                        decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                        ),
                        child: Text("Cambio de contraseña",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          backgroundColor: PrimaryColor
                        ),),
                        ),
                      Container(
                        height: size.height*0.03,
                        color: PrimaryColor,
                        child: Container(
                          decoration: BoxDecoration(
                            color: SecondaryColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(80),topRight: Radius.circular(0),bottomLeft:Radius.circular(0),bottomRight: Radius.circular(0) ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: size.height*0.01, left: size.height*0.002),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(0)),
                            ),),
                        ),
                  ),
                  input(password,"Contraseña",true),
                  input(newPassword,"Nueva contraseña",true),
                  input(confirmPassword,"Confirmar contraseña",true),
                 Container(
                   height: size.height*0.03,
                 ),
                 RaisedButton(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: PrimaryColor,
                      highlightElevation: 10.0,
                      disabledColor: BorderListColor,
                      onPressed: (){
                        setState(() {
                          _change();
                        });
                      },
                      child: Text(
                        "Actualizar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                        ),
                      ),
                    ),

                ],
              )

            ],
          ),
        ),
      );
    });
  }
  _change() {
    if(seller.password==password.text && newPassword.text==confirmPassword.text){
      seller.password=newPassword.text;
      BlocProvider.of<NavigationBloc>(context).add(UpdateSellerEvent(seller,imageFile,false));
      Navigator.pop(context);
    }else{
      Toast.show("No coinciden los datos", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
    limpiar();
  }

  _buttonAction(context, String option){
    if(option=="Actualizar"){
      _updateSeller(context, seller);
    }
    if(option=="Cambiar Contraseña"){
      _changePassword(context);
    }
    if(option=="Actualizar"){
      _change();
    }
  }
  limpiar(){
    password.text="";
    newPassword.text="";
    confirmPassword.text="";
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
