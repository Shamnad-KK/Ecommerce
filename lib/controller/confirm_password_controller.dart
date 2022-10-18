import 'package:flutter/material.dart';

class ConfirmPasswordController extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
