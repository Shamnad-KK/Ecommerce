import 'package:ecommerce/controller/bottom_nav_controller.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/profile_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  ProfileServices profileServices = ProfileServices();
  bool isLoading = false;

  void logOut(
      BuildContext context, BottomNavController bottomNavController) async {
    AppPopUps.logoutPopUp(context, () {
      isLoading = true;
      notifyListeners();
      profileServices.logOut(context).then((value) {
        if (value == '') {
          isLoading = false;
          notifyListeners();
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteNames.loginScreen, (route) => false);
          bottomNavController.setNewIndex(0);
        }
      });
    });
  }
}
