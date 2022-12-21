// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const THEME_STATUS = 'THEMESTATUS';

  void setTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = preferences.getBool(THEME_STATUS);
    return result ?? false;
  }
}
