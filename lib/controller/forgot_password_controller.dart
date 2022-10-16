import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  bool smsSelected = true;
  bool emailSelected = false;

  void setSmsSelection() {
    emailSelected = false;
    smsSelected = true;
    notifyListeners();
  }

  void setEmailSelection() {
    emailSelected = true;
    smsSelected = false;
    notifyListeners();
  }
}
