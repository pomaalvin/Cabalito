class ImagePublication{
  int _idImagePublication;
  String _path;

  int get idImagePublication => _idImagePublication;

  set idImagePublication(int value) {
    _idImagePublication = value;
  }

  String get path => _path;

  set path(String value) {
    _path = value;
  }
  Map toJson()=>{
    "idImagePublication":idImagePublication,
    "path":path
  };
}