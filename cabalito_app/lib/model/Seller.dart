import 'package:intl/intl.dart';
class Seller {
  int _idSeller;
  String _password;
  String _email;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _imagePath;
  Seller();

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  int get idSeller => _idSeller;

  set idSeller(int value) {
    _idSeller = value;
  }
  Map toJson()=>{
    'password':password,
    'email':email,
    "firstName":firstName,
    "lastName": lastName,
    "phoneNumber":phoneNumber,
    "imagePath":imagePath,
  };


}