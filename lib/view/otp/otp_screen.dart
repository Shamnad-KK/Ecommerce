import 'dart:developer';

import 'package:ecommerce/controller/otp_controller.dart';
import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.otpAction});
  final OtpAction otpAction;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpController otpController;
  @override
  void initState() {
    otpController = Provider.of<OtpController>(context, listen: false);
    otpController.changeTimer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      otpController.setTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    otpController.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupController =
        Provider.of<SignUpController>(context, listen: false);
    log(signupController.userNameController.text);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: AppPadding.mainPading,
              child: Column(
                children: [
                  AppSpacing.kHeight50,
                  Text(
                      "Code has been sent to +91 ${signupController.phoneController.text}"),
                  AppSpacing.kHeight50,
                  OtpTextField(
                    numberOfFields: 4,
                    showFieldAsBox: true,
                    autoFocus: true,
                    borderColor: AppColors.dullWhite,
                    disabledBorderColor: AppColors.borderColor,
                    enabledBorderColor: AppColors.borderColor,
                    cursorColor: AppColors.dullWhite,
                    focusedBorderColor: AppColors.dullWhite,
                    borderWidth: 1.5,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    fieldWidth: 60.0,
                    onSubmit: (String code) {
                      otpController.setCode(code);
                    },
                  ),
                  AppSpacing.kHeight50,
                  Consumer<OtpController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return value.timeRemaining != 0
                          ? Text("Resend code in ${value.timeRemaining} s")
                          : TextButton(
                              onPressed: () {
                                value.setResendVisibility(false);
                                value.resendOtp(context);
                              },
                              child: const Text(
                                "Resend OTP",
                                style: AppTextStyle.body2,
                              ),
                            );
                    },
                  ),
                  AppSpacing.kHeight50,
                  Consumer<OtpController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return value.isLoading
                          ? const CustomLoadingWidget()
                          : CustomButtonWidget(
                              text: "Verify",
                              onTap: () {
                                final otpModel = UserModel(
                                  userName:
                                      signupController.userNameController.text,
                                  email: signupController.emailController.text,
                                  phone: signupController.phoneController.text,
                                  password:
                                      signupController.passwordController.text,
                                );
                                otpController.submitOtp(
                                  context,
                                  widget.otpAction,
                                  otpModel,
                                );
                              },
                            );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
