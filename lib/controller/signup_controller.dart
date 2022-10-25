import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/services/signup_services.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpServices signUpServices = SignUpServices();

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> registerUser(BuildContext context) async {
    final user = UserModel(
      userName: userNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    await signUpServices.registerUser(user, context);
  }

  String? usernameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter username";
    } else if (value.startsWith(RegExp('0-9'))) {
      return "Username cannot start with number";
    } else {
      return null;
    }
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

  String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your mobile number";
    } else if (value.length < 10) {
      return "Please enter a valid mobile number";
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
