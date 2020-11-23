class Mechanic{
  int _idMechanic;
  String _location;
  String _shopName;
  int _stars;
  String _shopPhoneNumber;

  Mechanic();

  int get stars => _stars;

  set stars(int value) {
    _stars = value;
  }

  String get shopName => _shopName;

  set shopName(String value) {
    _shopName = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  int get idMechanic => _idMechanic;

  set idMechanic(int value) {
    _idMechanic = value;
  }

  String get shopPhoneNumber => _shopPhoneNumber;

  set shopPhoneNumber(String value) {
    _shopPhoneNumber = value;
  }

  Map toJson()=>{
    "idMechanic":idMechanic,
    "location":location,
    "shopName":shopName,
    "stars":stars,
    "shopPhoneNumber":shopPhoneNumber,
  };
}