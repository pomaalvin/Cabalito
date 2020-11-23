import 'package:cabalitoapp/model/Publication.dart';
import 'package:http/http.dart' as http;
import '../lib/ApiUrl.dart' as api;
class PublicationRepository{
  addPublication(Publication publication)async {
    final response = await http.get(api.url + "publications",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
  }
}