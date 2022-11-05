import 'dart:async';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/model/register_otp_verification_model.dart';
import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/model/verify_forgot_password_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/otp_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class OtpController extends ChangeNotifier {
  OtpServices otpServices = OtpServices();
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  bool isLoading = false;

  String code = '';

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void setTimer() {
    timeRemaining = 30;
    notifyListeners();
  }

  void setResendVisibility(bool newValue) {
    enableResend = newValue;
    timeRemaining = 30;
    notifyListeners();
  }

  void resendOtp(BuildContext context) {
    Navigator.of(context).pop();
    code = '';
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

  void submitOtp(BuildContext context, OtpAction otpAction, UserModel? model,
      VerifyForgotPasswordModel verifyForgotPasswordModel) async {
    isLoading = true;
    notifyListeners();
    if (code.length != 4) {
      await AppPopUps.showToast("Incorrect OTP", AppColors.errorColor);
      return;
    }
    if (otpAction == OtpAction.FORGOT_PASSWORD) {
      OtpServices().verifyForgotPasswordOtp(verifyForgotPasswordModel).then(
        (value) {
          if (value == "OTP verification success") {
            Navigator.pushReplacementNamed(
                context, RouteNames.confirmPasswordScreen);
          }
        },
      );
    } else if (otpAction == OtpAction.SIGN_UP) {
      final RegisterOtpVerificationModel otpModel =
          RegisterOtpVerificationModel(
        userName: model?.userName,
        email: model?.email,
        phone: model?.phone,
        password: model?.password,
      );

      await otpServices.verifySignUpOtp(otpModel, context, code).then((value) {
        if (value != null) {
          AppPopUps.showToast("Signed up successfully", Colors.green);
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNames.bottomNavBar,
            (route) => false,
          );
        }
      });
    } else if (otpAction == OtpAction.EDIT_PROFILE) {}
    isLoading = false;
    notifyListeners();
  }
}
