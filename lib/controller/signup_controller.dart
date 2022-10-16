import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  void setCheckVisibility(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
