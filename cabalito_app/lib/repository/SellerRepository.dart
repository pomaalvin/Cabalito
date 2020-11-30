import 'dart:convert';
import 'dart:io';
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
  Future<bool> updateSeller(Seller seller,File imageFile)async {
    try{
      var url=api.url + "seller";
      print(url);
      final response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(seller.toJson())
      );
      print(response.statusCode);
      if(response.statusCode==200){
        var resPub = jsonDecode(response.body);
        var idSeller=resPub["idSeller"];
        return await uploadImages(imageFile,idSeller);
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
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var element = jsonDecode(response.body);
      seller.idPerson=element['idPerson'];
      seller.idSeller=element['idSeller'];
      seller.idUser=element['idUser'];
      seller.firstName=element['firstName'];
      seller.lastName=element['lastName'];
      seller.email=element['email'];
      seller.phoneNumber=element['phoneNumber'];
      seller.imagePath=element['imagePath'];
      seller.password=element['password'];
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
      var request = http.MultipartRequest('PUT', uri)
        ..fields['idSeller'] = idSeller.toString();
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