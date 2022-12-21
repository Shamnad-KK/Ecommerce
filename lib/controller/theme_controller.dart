import 'package:ecommerce/helpers/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemePreferences themePreferences = ThemePreferences();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    themePreferences.setTheme(value);
    notifyListeners();
  }
}
