import 'dart:convert';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Publication.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
import 'dart:async';
import '../model/Color.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
class PublicationRepository{

  Future<bool> addPublication(Publication publication,List<File>images)async {
    try{
      var url=api.url + "publications";
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(publication.toJson())
      );
      if(response.statusCode==200){
        var resPub = jsonDecode(response.body);
        var idPublication=resPub["idPublication"];
        return await uploadImages(images,idPublication);
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
    }
  }
  Future<bool> uploadImages(List<File> list,idPublication)async{
    try{

      var uri = Uri.parse(api.url + "publications/images?idPublication="+idPublication.toString());
      var request = http.MultipartRequest('POST', uri)
        ..fields['idPublication'] = idPublication.toString();
      list.forEach((imageFile) async{
          request.files.add(await http.MultipartFile.fromPath("images", imageFile.path));
          });
      var response = await request.send();
      print(response.statusCode);
      if(response.statusCode==200){
        print("upload correcto");
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
  Future<List<Color>> getColors()async {
    try{
      List<Color> colors=List();
      var url=api.url + "publications/colors";
      print(url);
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List resCol = jsonDecode(response.body);
      resCol.forEach((element) {
        Color newColor=Color();
        newColor.idColor=element["idColor"];
        newColor.color=element["color"];
        colors.add(newColor);
      });
      print(colors);
      if(response.statusCode==200){
        return colors;
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
  Future<List<Brand>> getBrands()async {
    try{
      List<Brand> brands=List();
      var url=api.url + "publications/brands";
      print(url);
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List resCol = jsonDecode(response.body);
      resCol.forEach((element) {
        Brand newBrand=Brand();
        newBrand.idBrand=element["idBrand"];
        newBrand.brand=element["brand"];
        brands.add(newBrand);
      });
      if(response.statusCode==200){
        return brands;
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
  Future<List<City>> getCities()async {
    try{
      List<City> cities=List();
      var url=api.url + "publications/cities";
      print(url);
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List resCol = jsonDecode(response.body);
      resCol.forEach((element) {
        City newCity=City();
        newCity.idCity=element["idCity"];
        newCity.city=element["city"];
        cities.add(newCity);
      });
      if(response.statusCode==200){
        return cities;
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
}