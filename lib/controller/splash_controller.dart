import 'package:ecommerce/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final SplashServices splashServices = SplashServices();
  void checkLogin(BuildContext context) {
    splashServices.checkLogin(context);
  }
}
