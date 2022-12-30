import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeChanger extends ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(theme) {
    print("call theme mode");
    _themeMode = theme;
    notifyListeners();
  }

  bool radiovalue = false;
  void checkTheme(value) {
    print("call theme mode");

    _themeMode = value ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}
