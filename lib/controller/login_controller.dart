// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  LoginServices loginServices = LoginServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? model;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  bool isLoading = false;

  void login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    model = await loginServices.login(context, loginModel);
    isLoading = false;
    if (model != null) {
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNavBar, (route) => false);
    }
    notifyListeners();
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
