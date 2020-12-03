class PasswordRequest{
  String _newPassword;
  String _oldPassword;

  String get newPassword => _newPassword;

  set newPassword(String value) {
    _newPassword = value;
  }

  String get oldPassword => _oldPassword;

  set oldPassword(String value) {
    _oldPassword = value;
  }

  PasswordRequest();

  Map toJson()=>{
    "newPassword":newPassword,
    "oldPassword":oldPassword
  };
}