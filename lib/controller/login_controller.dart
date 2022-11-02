import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  LoginServices loginServices = LoginServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    loginServices.login(context, loginModel).then(
      (value) {
        if (value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.bottomNavBar, (route) => false);
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void signinWithGoogle(BuildContext context) async {
    loginServices.signinWithGoogle().then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.bottomNavBar, (route) => false);
      }
    });
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
