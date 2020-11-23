import 'dart:convert';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
class SellerRepository{
  Future<bool> addSeller(Seller seller)async {
    try{
      var url=api.url + "seller";
      print(url);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(seller.toJson())
      );
      print(response.statusCode);
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