import 'dart:developer';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/model/confirm_passwordmodel.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/confirm_password_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordController extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  bool isLoading = false;
  void clearController() {
    passwordController.clear();
  }

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void confirmNewPassword(
      CreateNewPasswordModel model, BuildContext context) async {
    log("qqqq ${model.email}");
    isLoading = true;
    notifyListeners();
    ConfirmPasswordServices().confirmNewPassword(model).then((value) {
      if (value != null) {
        AppPopUps.showToast("Password changed successfully, Please login",
            AppColors.successColor);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.loginScreen, (route) => false);
      }
    });
    isLoading = false;
    notifyListeners();
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
