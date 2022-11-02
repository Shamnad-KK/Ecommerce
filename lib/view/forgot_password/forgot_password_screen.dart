import 'package:ecommerce/controller/forgot_password_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, required this.otpAction});
  final OtpAction otpAction;

  @override
  Widget build(BuildContext context) {
    final forgotPasswordController =
        Provider.of<ForgotPasswordController>(context, listen: false);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/forgot_password/forgotpassword-removebg-preview.png",
                    height: size.height * 0.3,
                    width: size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
                AppSpacing.kHeight30,
                const Text("Find your email"),
                AppSpacing.kHeight30,
                CustomTextField(
                  controller: forgotPasswordController.emailController,
                  hint: "Email",
                ),
                AppSpacing.kHeight30,
                CustomButtonWidget(
                  text: "Continue",
                  onTap: () {
                    forgotPasswordController.onContinue(context, otpAction);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
