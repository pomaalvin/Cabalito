import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
alertOk(msg){
  Fluttertoast.showToast(msg: msg,fontSize: 14,backgroundColor: Colors.lightGreen.withOpacity(0.8),textColor: Colors.white,gravity: ToastGravity.CENTER);
}
alertErrorOut(msg){
  Fluttertoast.showToast(msg: msg,fontSize: 14,backgroundColor: colorError.withOpacity(0.8),textColor: Colors.white,gravity: ToastGravity.CENTER);
}
alertError(msg,context){
  FToast toast=FToast();
  toast.init(context);
  toast.showToast(child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
        color: Colors.red.withOpacity(0.8),
    ),
    width: MediaQuery.of(context).size.width*0.8,
    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.035),
    child: Center(
      child: Text(msg,style: TextStyle(fontSize: 15,color: Colors.white),),
    )
  ) ,
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          bottom: MediaQuery.of(context).size.height*0.1,
          left: MediaQuery.of(context).size.width*0.1,
        );
      });
}
alertGen(msg,context){
  FToast toast=FToast();
  toast.init(context);
  toast.showToast(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.black.withOpacity(0.8),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.035),
      child: Center(
        child: Text(msg,style: TextStyle(fontSize: 15,color: Colors.white),),
      )
  ) ,
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          bottom: MediaQuery.of(context).size.height*0.1,
          left: MediaQuery.of(context).size.width*0.1,
        );
      });
}