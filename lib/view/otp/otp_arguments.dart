import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';

class OtpArguments {
  final OtpAction otpAction;
  final UserModel user;

  OtpArguments({required this.otpAction, required this.user});
}
