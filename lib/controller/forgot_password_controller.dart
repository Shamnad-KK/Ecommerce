import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/forget_password_services.dart';
import 'package:ecommerce/services/otp_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  ForgetPasswordServices forgetPasswordServices = ForgetPasswordServices();
  OtpServices otpServices = OtpServices();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void onContinue(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await forgetPasswordServices
        .userCheck(emailController.text)
        .then((userValue) async {
      if (userValue != null) {
        await otpServices.sendOtp(userValue.email!).then((otpValue) {
          if (otpValue != null) {
            AppPopUps.showToast(
                'Otp sent successfully', AppColors.successColor);
            final otpArguments = OtpArguments(
                otpAction: OtpAction.FORGOT_PASSWORD, user: userValue);
            Navigator.of(context)
                .pushNamed(RouteNames.otpScreen, arguments: otpArguments);
          }
        });
      } else {
        AppPopUps.showToast('User not found', AppColors.errorColor);
      }
    });
    isLoading = false;
    notifyListeners();
  }
}
