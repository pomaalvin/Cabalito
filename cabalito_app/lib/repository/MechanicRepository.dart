import 'dart:convert';
import 'package:cabalitoapp/lib/token.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/Stars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
class MechanicRepository{
  Future<List<Mechanic>>getMechanic()async{
    try{
      List<Mechanic>mechanics=List();
      var url=api.url + "mechanic";
      var token=await Token().getToken();
      final response = await http.get(url,
        headers: <String,String>{
        'Content-Type':'application/json; charset=UTF-8',
          'Authorization':token
        }
      );
      List mechanic= json.decode(utf8.decode(response.bodyBytes));
      mechanic.forEach((element) {
        Mechanic newMechanic=Mechanic();
        newMechanic.idMechanic=element["idMechanic"];
        newMechanic.stars=element["stars"];
        newMechanic.shopName=element["shopName"];
        newMechanic.location=element["location"];
        newMechanic.shopPhoneNumber=element["shopPhoneNumber"];
        mechanics.add(newMechanic);
      });
      print(mechanics);
      if(response.statusCode==200){
        return mechanics;
      }
      else{
        return null;
      }
    }
    catch(e){
      print(e);
    }
  }
  Future<bool>addQualification(Stars stars)async{
    try{
      var url=api.url + "mechanic";
      var token=await Token().getToken();
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':token
          },
          body: jsonEncode(stars.toJson())
      );
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
    }
  }
}