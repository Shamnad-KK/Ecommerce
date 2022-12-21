import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ProfileServices {
  Future<String?> logOut(BuildContext context) async {
    try {} catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
    return null;
  }
}
