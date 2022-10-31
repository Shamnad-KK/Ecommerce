// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/signup_services.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpServices signUpServices = SignUpServices();

  bool isLoading = false;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> registerUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final user = UserModel(
      userName: userNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    signUpServices.registerUser(user, context).then((value) {
      isLoading = false;
      notifyListeners();
      if (value != null) {
        final args = OtpArguments(otpAction: OtpAction.SIGN_UP);
        Navigator.of(context).pushNamed(RouteNames.otpScreen, arguments: args);
      }
    });
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
