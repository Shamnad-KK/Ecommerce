import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  LoginServices loginServices = LoginServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void login(BuildContext context) async {
    final LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    await loginServices.login(context, loginModel);
  }

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    } else if (!value.contains("@") ||
        !value.contains(".") ||
        value.startsWith("@")) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password should have atleast 6 characters";
    } else {
      return null;
    }
  }
}
