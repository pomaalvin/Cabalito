
import'dart:io';
import 'dart:ui';

import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:cabalitoapp/model/Publication.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/publicationItem/AlertItemPublication.dart';
import 'package:cabalitoapp/screens/publicationItem/CardImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../lib/Colors.dart';


class AddPublication extends StatefulWidget{
  List<Color> colors;
  List<Brand> brands;
  List<City> cities;
  AddPublication(this.colors,this.brands,this.cities);
  @override
  State createState() => _AddPublicationState(colors,brands,cities);
}

class _AddPublicationState extends State<AddPublication>{
  _AddPublicationState(this.colors,this.brands,this.cities);
  List<Color> colors;
  Color newColor;
  Brand newBrand;
  City newCity;
  List<Brand> brands=List();
  List<City> cities=List();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController plate = TextEditingController();
  TextEditingController dNumber = TextEditingController();
  TextEditingController motor = TextEditingController();
  List<File> imagePublication=List();
  File imageSelected;
  _openGallery() async{
    var imagePicker = ImagePicker();
    var picture=await imagePicker.getImage(source:  ImageSource.gallery);
    if(picture!=null){
      this.setState(() {
        imageSelected=File(picture.path);
        imagePublication.add(File(picture.path));
      });
    }


    //this.setState({});
  }
  _openCamera() async{

    var imagePicker = ImagePicker();
    var picture=await imagePicker.getImage(source:  ImageSource.camera);
    if(picture!=null){
      this.setState(() {
        imageSelected=File(picture.path);
        imagePublication.add(File(picture.path));
      });
    }
  }



  @override
  void initState(){
    super.initState();

  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    size=Size(size.width,size.height-size.height*0.13);
    return new Scaffold(
        backgroundColor: Colors.transparent,
        body:
              Container(
                height:size.height,
                child: Center(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    padding: EdgeInsets.only(top: size.height*0.02),
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: size.width*0.25),
                        child: Material(
                            elevation:1,
                            shadowColor: PrimaryColor,
                            borderRadius:BorderRadius.circular(size.height*0.01),
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(size.height*0.01),
                              child: Container(
                                child: Container(
                                  height:size.width*0.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imagePublication.length==0?AssetImage("assets/publication/no_image.jpg"):FileImage(imageSelected),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: imageList(),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: input(title,size.width*0.8,"Titulo",20.0,TextInputType.text),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: inputArea(description, size.width*0.8, 140.0, "Descripcion", 15.0),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buttonInput(null, size.width*0.25, "Marca", size.height*0.07,TextInputType.text),
                            buttonInput(null, size.width*0.25, "Color", size.height*0.07,TextInputType.number),
                            buttonInput(null, size.width*0.25, "Ciudad", size.height*0.07,TextInputType.number),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            input(plate, size.width*0.35, "Placa", size.height*0.02,TextInputType.text),
                            input(model, size.width*0.35, "Modelo",size.height*0.02,TextInputType.number),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            input(dNumber, size.width*0.25, "N° Puertas",size.height*0.02,TextInputType.number),
                            input(motor, size.width*0.25, "Motor",size.height*0.02,TextInputType.text),
                            input(price, size.width*0.25, "Precio",size.height*0.02,TextInputType.text),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),

                      Container(
                        width: size.width,
                        height: size.height*0.08,

                        child: MaterialButton(

                          color:PrimaryColor,
                          onPressed: (){
                                _addPublication();
                          },
                          child: Center(
                            child: Text("Guardar",style:TextStyle(color:color4,fontSize: size.height*0.03)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
          ),
              ),
    );
  }
  Widget buttonInput(controller,width,text,height,type,){
    return GestureDetector(
      onTap: ()async {
        var alert=AlertItemPublication();
        switch(text) {
          case "Ciudad":
            var city=await alert.alertCity(context, cities);
            if(city!=null){
              setState(() {
                newCity=city;
              });
            }
            break;
          case "Marca":
            var brand=await alert.alertBrand(context, brands);
            if(brand!=null){
              setState(() {
                newBrand=brand;
              });
            }
            break;
          case "Color":
             var color =await alert.alertColor(context, colors);
             if(color!=null){
               setState(() {
                 newColor=color;
               });
             }
            break;
        }
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: PrimaryColor,
            border: Border.all(color: PrimaryColor,width: 0),
            borderRadius: BorderRadius.circular(height*0.1)
        ),
        child: Center(
          child: Text(text=="Marca"&&newBrand!=null?newBrand.brand:text=="Color"&&newColor!=null?newColor.color:text=="Ciudad"&&newCity!=null?newCity.city:text,style:TextStyle(color:color4.withOpacity(0.5))),
        ),

      ),
    );
  }
  Widget inputArea(controller,width,height,text,font){
    return Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: PrimaryColor,width: 0),
              borderRadius: BorderRadius.circular(font*0.3)
          ),
          child: TextField(
            controller: controller,
            scrollPadding: EdgeInsets.all(0),
            maxLines: null,
            maxLength: 255,
            keyboardType: TextInputType.multiline,
            cursorColor: color3,
            cursorWidth: 1,
            style: TextStyle(color: PrimaryColor,fontSize: font),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),

                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(color: PrimaryColor.withOpacity(0.6)),
                hintText: text
            ),
          ),
        );
  }
  Widget input(controller,width,text,font,type){
    return Container(
        width: width,
          alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: PrimaryColor,width: 0),
          borderRadius: BorderRadius.circular(font*0.3)
        ),
        child:TextField(
          controller:controller,
            keyboardType: type,
            cursorColor: color3,
            cursorWidth: 1,
            style: TextStyle(color: PrimaryColor,fontSize: font,
              height: 1,),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),

                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(color: PrimaryColor.withOpacity(0.6)),
                hintText: text
            ),
          ),
    );
  }
  Widget imageList(){
    return Material(
      borderRadius: BorderRadius.circular(size.height*0.07*0.125),
      elevation: 0,
      color: color4,

      shadowColor: PrimaryColor,
      child: Container(
        width:size.width*0.8,
        height:size.height*0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height*0.07*0.125),
            border: Border.all(color:PrimaryColor.withOpacity(0.4),width: 0)
        ),
        child: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10
                ),
                itemCount: imagePublication.length+1,
                scrollDirection: Axis.horizontal,
                padding:  EdgeInsets.all(size.height*0.07*0.1),
                itemBuilder: (context,index){
                  if(index==0){
                    return Container(
                      width:size.height*0.07*0.8,
                      height:size.height*0.07*0.8,
                      decoration: BoxDecoration(
                        color:PrimaryColor,
                        border: Border.all(color:PrimaryColor),
                        borderRadius: BorderRadius.circular(size.height*0.01),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        elevation:0.5,
                        onPressed: (){
                          _showChoiceDialog(context);
                        },
                        child:Center(
                          child: Icon(
                            Icons.add_a_photo,
                            color: color4,
                            size: size.height*0.07*0.4,
                          ),
                        ),
                      ),
                    );
                  }
                  else{
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          imageSelected=imagePublication[index-1];
                        });
                      },
                      child: CardImage(imagePublication[index-1], size)
                    );
                  }
                }
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _showChoiceDialog(BuildContext context){
    if(imagePublication.length<=4) {
      return showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          title: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(3),topRight: Radius.circular(3)),
              color: SecondaryColor,
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          content: Container(
            padding: EdgeInsets.only(top:20,bottom:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              GestureDetector(
                child: Container(
                  height: size.height*0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt,size:size.height*0.1*0.51,color: PrimaryColor,),
                      Text("Camara",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
                onTap: () {
                  _openCamera();
                  Navigator.pop(context);
                },
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              GestureDetector(
                child: Container(
                    height: size.height*0.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size:size.height*0.1*0.5,color: PrimaryColor,),
                        Text("Galeria",style: TextStyle(fontSize: 18),)
                      ],
                    )
                ),
                onTap: () {
                  _openGallery();
                  Navigator.pop(context);
                },
              )
            ],
            ),
          )
        );
      });
    }
    else{
    }
  }

  _addPublication(){
    Publication publication= Publication();
    publication.idColor=newColor.idColor;
    publication.idBrand=newBrand.idBrand;
    publication.idCity=newCity.idCity;
    publication.datePublication=DateTime.now();
    publication.description=description.text;
    print(dNumber.text);
    publication.doorNumber=int.parse(dNumber.text);
    publication.model=int.parse(model.text);
    publication.title=title.text;
    publication.motor=motor.text;
    publication.licensePlate=plate.text;
    print(price.text);
    publication.price=double.parse(price.text);
    BlocProvider.of<NavigationBloc>(context).add(AddPublicationEvent(publication,imagePublication));

  }
  }
