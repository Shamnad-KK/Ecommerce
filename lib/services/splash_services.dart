import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  void checkLogin(BuildContext context) async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = await manager.getToken();

      if (token == '') {
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.loginScreen, (route) => false);
          },
        );
      } else {
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.bottomNavBar, (route) => false);
          },
        );
      }
    } catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
  }
}
