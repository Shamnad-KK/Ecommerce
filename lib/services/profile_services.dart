import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  Future<String?> logOut(BuildContext context) async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      await manager.logOut();
      final token = await manager.getToken();
      return token;
    } catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
    return null;
  }
}
