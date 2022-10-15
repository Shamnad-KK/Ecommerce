import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  void checkLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, RouteNames.onboardingScreen);
      },
    );
  }
}
