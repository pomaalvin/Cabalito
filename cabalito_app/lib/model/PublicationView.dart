class PublicationView{
  String _title;
  String _description;
  double _price;
  String _brand;//id
  int _model;
  String _licensePlate;
  String _Color;//id
  String _motor;
  String _phoneNumber;
  int _doorNumber;
  int _idSeller;
  String _City; // id
  List <String> _images;
  PublicationView();

  String get City => _City;

  set City(String value) {
    _City = value;
  }

  int get idSeller => _idSeller;

  set idSeller(int value) {
    _idSeller = value;
  }

  int get doorNumber => _doorNumber;

  set doorNumber(int value) {
    _doorNumber = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get motor => _motor;

  set motor(String value) {
    _motor = value;
  }

  String get Color => _Color;

  set Color(String value) {
    _Color = value;
  }

  String get licensePlate => _licensePlate;

  set licensePlate(String value) {
    _licensePlate = value;
  }

  int get model => _model;

  set model(int value) {
    _model = value;
  }

  String get brand => _brand;

  set brand(String value) {
    _brand = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List<String> get images => _images;

  set images(List<String> value) {
    _images = value;
  }



}