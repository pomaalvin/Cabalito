class Stars{
  int _idUser;
  int _idMechanic;
  int _score;

  Stars();

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  int get idMechanic => _idMechanic;

  set idMechanic(int value) {
    _idMechanic = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }


  Map toJson() =>{
    "idUser":idUser,
    "idMechanic":idMechanic,
    "score":score,
  };
}
