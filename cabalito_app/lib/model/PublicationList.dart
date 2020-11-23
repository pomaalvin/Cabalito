import 'package:intl/intl.dart';
class ListPublication {
  String _title;
  double _price;
  int _idPublication;
  String _imagePath;

  ListPublication();


  double get price => _price;

  set price(double value) {
    _price = value;
  }


  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get idPublication => _idPublication;

  set idPublication(int value) {
    _idPublication = value;
  }

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }
}