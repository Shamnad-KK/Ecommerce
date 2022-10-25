// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  Future<void> logOut(BuildContext context) async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      await manager.logOut();
      final token = await manager.getToken();
      if (token == '') {
        await Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.loginScreen, (route) => false);
      }
    } catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
  }
}
