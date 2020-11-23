class Color{
  int _idColor;
  String _color;

  Color();

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  int get idColor => _idColor;

  set idColor(int value) {
    _idColor = value;
  }
}