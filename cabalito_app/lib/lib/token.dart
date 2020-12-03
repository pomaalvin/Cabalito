import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Future<String> getToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");

  }
  Future <bool>setToken(String token)async{
    try{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
  Future <bool>delToken()async{
    try{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.remove("token");
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}