import 'package:flutter/material.dart';
import 'package:wall/features/theme/dark_mode/dark_mode.dart';
import 'package:wall/features/theme/light_mode/light_mode.dart' show lightMode;

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleThemes() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
