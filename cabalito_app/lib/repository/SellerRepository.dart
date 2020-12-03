import 'dart:convert';
import 'dart:io';
import 'package:cabalitoapp/lib/token.dart';
import 'package:cabalitoapp/model/LoginRequest.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
class SellerRepository{
  Future<bool> signin(LoginRequest loginRequest)async {
    try{
      var url=api.url + "user/signin";
      print(url);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginRequest.toJson())
      );
      print(response.body);
      if(response.statusCode==200){
        var tok=json.decode(response.body)["token"];
        await Token().setToken(tok);
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
  Future<bool> signup(Seller seller,LoginRequest loginRequest)async {
    try{
      var url=api.url + "user/signup";
      print(url);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginRequest.toJson())
      );
      print(response.statusCode);
      if(response.statusCode==200){
        var urlSignup=api.url + "seller";
        print(urlSignup);
        var body=json.decode(response.body);
        final res = await http.post(urlSignup,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':body["token"],
            },
            body: jsonEncode(seller.toJson())
        );
        if(res.statusCode==200){
          return true;
        }
        else{
          return false;
        }
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
  Future<bool> updateSeller(Seller seller,File imageFile, bool flag)async {
    try{
      var url=api.url + "seller";
      print(url);
      var token=await Token().getToken();
      final response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':token
          },
          body: jsonEncode(seller.toJson())
      );
      print(response.statusCode);
      if(response.statusCode==200){
        var resPub = jsonDecode(response.body);
        var idSeller=resPub["idSeller"];
        if(flag){
          return await uploadImages(imageFile,idSeller);
        } else{
          return true;
        }
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
    }
  }
  Future<Seller> getSeller()async {
    try{
      Seller seller=Seller();
      var url=api.url + "seller";
      var token=await Token().getToken();
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':token
          }
      );
      var element = jsonDecode(response.body);
      seller.idPerson=element['idPerson'];
      seller.idSeller=element['idSeller'];
      seller.firstName=element['firstName'];
      seller.lastName=element['lastName'];
      seller.phoneNumber=element['phoneNumber'];
      seller.imagePath=element['imagePath'];
      if(response.statusCode==200){
        return seller;
      }
      else{
        return null;
      }
    }
    catch(e){
      print(e);
      return null;

    }
  }
  Future<bool> uploadImages(File imageFile,idSeller)async{
    try{

      var uri = Uri.parse(api.url + "/seller/image?idSeller"+idSeller.toString());
      var token=await Token().getToken();
      var request = http.MultipartRequest('PUT', uri)
        ..fields['idSeller'] = idSeller.toString()
      ..headers["Authorization"]=token;
        request.files.add(await http.MultipartFile.fromPath("images", imageFile.path));
      var response = await request.send();
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
}