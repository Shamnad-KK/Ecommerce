import 'package:ecommerce/services/profile_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  ProfileServices profileServices = ProfileServices();

  void logOut(BuildContext context) async {
    await AppPopUps.logoutPopUp(context, () async {
      await profileServices.logOut(context);
    });
  }
}
