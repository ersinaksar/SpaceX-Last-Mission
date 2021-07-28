import 'package:flutter/material.dart';

class MyTheme {
  MaterialColor _color;
  ThemeData _tema;

  MaterialColor get color => _color;

  set color(MaterialColor value) {
    _color = value;
  }

  ThemeData get tema => _tema;

  set tema(ThemeData value) {
    _tema = value;
  }

  MyTheme(this._color, this._tema);
}
