import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  bool smsSelected = true;
  bool emailSelected = false;

  void setSmsSelection() async {
    emailSelected = false;
    smsSelected = true;
    notifyListeners();
  }

  void onContinue(BuildContext context) async {
    if (smsSelected == true) {
      await Navigator.of(context).pushNamed(RouteNames.otpScreen);
    } else {}
  }

  void setEmailSelection() {
    emailSelected = true;
    smsSelected = false;
    notifyListeners();
  }
}
