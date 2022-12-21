// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/forget_password_services.dart';
import 'package:ecommerce/services/otp_services.dart';
import 'package:ecommerce/services/signup_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpServices signUpServices = SignUpServices();
  ForgetPasswordServices forgetPasswordServices = ForgetPasswordServices();
  OtpServices otpServices = OtpServices();

  bool isLoading = false;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> userCheck(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final user = UserModel(
      userName: userNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    await forgetPasswordServices
        .userCheck(emailController.text)
        .then((value) async {
      //If null means user with this email is not null ( Already exists )
      if (value != null) {
        AppPopUps.showToast("User already exists", AppColors.errorColor);
        isLoading = false;
        notifyListeners();
        return;
      } else {
        await otpServices.sendOtp(emailController.text).then((value) {
          if (value != null) {
            final args = OtpArguments(
              otpAction: OtpAction.SIGN_UP,
              user: user,
            );
            Navigator.of(context)
                .pushNamed(RouteNames.otpScreen, arguments: args);
          }
        });
      }
    });
    isLoading = false;
    notifyListeners();
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

  String? confirmPasswordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value != passwordController.text) {
      return "Password does not match";
    } else {
      return null;
    }
  }
}
