// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/helpers/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../routes/route_names.dart';

class SplashController extends ChangeNotifier {
  TokenManager tokenManager = TokenManager();

  String? accessToken;

  void checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    accessToken = await tokenManager.getAccessToken();
    String? onboardCheck =
        await const FlutterSecureStorage().read(key: 'onBoard');
    if (accessToken != null) {
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNavBar, (route) => false);
    } else if (onboardCheck != null) {
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.loginScreen, (route) => false);
    } else {
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.onboardingScreen, (route) => false);
    }
  }
}
