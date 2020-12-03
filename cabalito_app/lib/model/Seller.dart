import 'package:intl/intl.dart';
class Seller {
  int _idSeller;
  int _idPerson;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _imagePath;
  String _email;
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


  int get idSeller => _idSeller;

  set idSeller(int value) {
    _idSeller = value;
  }
  int get idPerson => _idPerson;

  set idPerson(int value) {
    _idPerson = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  Map toJson()=>{
    'idSeller': idSeller,
    'idPerson': idPerson,
    "firstName":firstName,
    "lastName": lastName,
    "phoneNumber":phoneNumber,
    "imagePath":imagePath,
  };
}