import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertItemPublication{
  alertColor(context,List<Color> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              titlePadding: EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.all(10),
                color: PrimaryColor,
                child: Center(
                  child: Text("Color",style: TextStyle(color: color4),),
                ),
              ),
              content: Container(
                width: size.width,
                height: size.height*0.3,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context,index){
                      return GestureDetector(

                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                          color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                          child: Center(
                            child:Text(list[index].color),
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context,list[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
          );
      }
    );
  }
  alertCity(context,List<City> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(

            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Ciudad",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].city),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  alertBrand(context,List<Brand> list)async{
    var size=MediaQuery.of(context).size;
    return await showDialog(
        context: (context),
        builder: (context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(10),
              color: PrimaryColor,
              child: Center(
                child: Text("Marca",style: TextStyle(color: color4),),
              ),
            ),
            content: Container(
              width: size.width,
              height: size.height*0.3,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.02),
                        color: index%2==0?PrimaryColor.withOpacity(0.1):color4,
                        child: Center(
                          child:Text(list[index].brand),
                        ),
                      ),
                      onTap: (){
                        Navigator.pop(context,list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}