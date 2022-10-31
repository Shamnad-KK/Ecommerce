import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/forget_password_services.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  bool smsSelected = true;
  bool emailSelected = false;
  TextEditingController emailController = TextEditingController();

  void setSmsSelection() async {
    emailSelected = false;
    smsSelected = true;
    notifyListeners();
  }

  void onContinue(BuildContext context, OtpAction otpAction) async {
    final otpArguments = OtpArguments(otpAction: otpAction);
    await ForgetPasswordServices().getOtp(emailController.text).then(
      (value) {
        if (value != null) {
          Navigator.of(context)
              .pushNamed(RouteNames.otpScreen, arguments: otpArguments);
        }
      },
    );
  }

  void setEmailSelection() {
    emailSelected = true;
    smsSelected = false;
    notifyListeners();
  }
}
