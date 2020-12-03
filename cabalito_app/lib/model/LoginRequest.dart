class LoginRequest{
  String _email;
  String _password;
  String _token;

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  LoginRequest();
  Map toJson()=>{
    'email': email,
    'password': password
  };
}