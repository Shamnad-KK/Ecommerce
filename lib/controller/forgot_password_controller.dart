import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  bool smsSelected = true;
  bool emailSelected = false;

  void setSmsSelection() async {
    emailSelected = false;
    smsSelected = true;
    notifyListeners();
  }

  void onContinue(BuildContext context, OtpAction otpAction) async {
    if (smsSelected == true) {
      final otpArguments = OtpArguments(otpAction: otpAction);
      await Navigator.of(context)
          .pushNamed(RouteNames.otpScreen, arguments: otpArguments);
    } else {}
  }

  void setEmailSelection() {
    emailSelected = true;
    smsSelected = false;
    notifyListeners();
  }
}
