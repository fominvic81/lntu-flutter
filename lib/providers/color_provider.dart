import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _color = Color.fromARGB(255, 127, 127, 127);

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}
