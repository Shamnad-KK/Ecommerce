import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isChecked = false;
  bool get isChecked => _isChecked;
  void setCheckVisibility(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
