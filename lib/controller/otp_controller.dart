// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class OtpController extends ChangeNotifier {
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;

  String code = '';

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void setResendVisibility(bool newValue) {
    enableResend = newValue;
    timeRemaining = 30;
    notifyListeners();
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }

  void submitOtp(BuildContext context) async {
    if (code.length != 4) {
      await AppPopUps.showToast("Incorrect OTP", AppColors.errorColor);
      return;
    }
    await AppPopUps.showToast("Otp verified", AppColors.successColor);
    await Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.homeScreen, (route) => false);
  }
}
