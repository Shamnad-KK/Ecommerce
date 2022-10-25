// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  final SharedPreferences _preferences;

  PreferenceManager(this._preferences);

  //Key for saving token
  static const String AUTHORIZATION_TOKEN = 'token';

  //A setter for updating tokens for each users
  set token(String token) {
    _preferences.setString(AUTHORIZATION_TOKEN, token);
  }

  //A getter for accessing the current saved token
  String get accessToken {
    return _preferences.getString(AUTHORIZATION_TOKEN) ?? '';
  }

  //This is a method for getting the current saved token
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PreferenceManager manager = PreferenceManager(sharedPreferences);
    return manager.accessToken;
  }

  //This is a method of deleting the stored token
  Future<void> logOut() async {
    await _preferences.setString(AUTHORIZATION_TOKEN, '');
  }
}
