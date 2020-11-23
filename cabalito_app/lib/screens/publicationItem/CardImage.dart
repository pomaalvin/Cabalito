
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget{
  File imagePublication;
  Size size;
  CardImage(this.imagePublication,this.size);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Material(
        elevation:0.5,
        borderRadius:BorderRadius.circular(size.height*0.01),
        child:ClipRRect(
          borderRadius: BorderRadius.circular(size.height*0.01),
          child: Container(
            width:size.height*0.07*0.8,
            height:size.height*0.07*0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imagePublication==null?AssetImage("assets/publication/no_image.jpg"):FileImage(imagePublication),
                  fit: BoxFit.cover
              ),
            ),
          ),
        )
    );
  }

}