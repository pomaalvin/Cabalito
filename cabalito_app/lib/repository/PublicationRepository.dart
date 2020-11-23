import 'dart:convert';

import 'package:cabalitoapp/model/Publication.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
class PublicationRepository{
  Future<bool> addPublication(Publication publication)async {
    try{
      var url=api.url + "publications";
      print(url);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(publication.toJson())
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