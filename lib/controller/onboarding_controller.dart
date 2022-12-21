// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../routes/route_names.dart';

class OnboardingController extends ChangeNotifier {
  late PageController pageController;
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  void toSignInScreen(BuildContext context) async {
    await storage.write(key: 'onBoard', value: 'completed');
    await Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.loginScreen, (route) => false);
  }
}
