import 'package:intl/intl.dart';
class Publication {
  int _idPublication;
  int _idSeller;
  int _idBrand;
  int _idColor;
  int _idCity;
  String _title;
  int _model;
  int _doorNumber;
  String _licensePlate;
  String _description;
  String _motor;
  double _price;
  DateTime _datePublication;
  int _status;
  List <String> _images;
  Publication();

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  DateTime get datePublication => _datePublication;

  set datePublication(DateTime value) {
    _datePublication = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get motor => _motor;

  set motor(String value) {
    _motor = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get licensePlate => _licensePlate;

  set licensePlate(String value) {
    _licensePlate = value;
  }

  int get doorNumber => _doorNumber;

  set doorNumber(int value) {
    _doorNumber = value;
  }

  int get model => _model;

  set model(int value) {
    _model = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get idCity => _idCity;

  set idCity(int value) {
    _idCity = value;
  }

  int get idColor => _idColor;

  set idColor(int value) {
    _idColor = value;
  }

  int get idBrand => _idBrand;

  set idBrand(int value) {
    _idBrand = value;
  }

  int get idSeller => _idSeller;

  set idSeller(int value) {
    _idSeller = value;
  }

  int get idPublication => _idPublication;

  set idPublication(int value) {
    _idPublication = value;
  }

  List<String> get images => _images;

  set images(List<String> value) {
    _images = value;
  }

  Map toJson()=>{
  'idPublication':idPublication,
   'idSeller':idSeller,
   "idBrand":idBrand,
  "idColor": idColor,
   "idCity":idCity,
   "title":title,
  "model":model,
   "doorNumber":doorNumber,
   "licensePlate":licensePlate,
   "description":description,
   "motor":motor,
   "price":price,
   "datePublication":DateFormat('yyyy-MM-dd - kk;mm').format(datePublication)
  };
}