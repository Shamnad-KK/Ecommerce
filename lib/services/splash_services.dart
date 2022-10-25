// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  void checkLogin(BuildContext context) async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = await manager.getToken();
      await Future.delayed(const Duration(seconds: 2));
      if (token == '') {
        await Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.loginScreen, (route) => false);
      } else {
        await Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.bottomNavBar, (route) => false);
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
  }
}
