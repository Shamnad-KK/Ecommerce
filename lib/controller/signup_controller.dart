import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
