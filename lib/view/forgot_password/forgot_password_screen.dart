import 'package:ecommerce/controller/forgot_password_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/view/forgot_password/widgets/forgot_password_custom_choicechip.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, required this.otpAction});
  final OtpAction otpAction;

  @override
  Widget build(BuildContext context) {
    final forgotPasswordController =
        Provider.of<ForgotPasswordController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      forgotPasswordController.setSmsSelection();
    });
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
                const Text(
                  "Select which contact should we use to reset your password",
                  style: AppTextStyle.body2,
                ),
                AppSpacing.kHeight30,
                Consumer<ForgotPasswordController>(
                    builder: (BuildContext context, value, Widget? child) {
                  return ForgotPasswordChoiceChipWidget(
                    icon: Icons.message,
                    tile: "via SMS",
                    subtitle: "+91 9207****46",
                    isSelected: value.smsSelected,
                    borderColor: forgotPasswordController.smsSelected
                        ? AppColors.whiteColor
                        : AppColors.transparent,
                    onTap: () {
                      value.setSmsSelection();
                    },
                  );
                }),
                AppSpacing.kHeight10,
                Consumer<ForgotPasswordController>(
                    builder: (BuildContext context, value, Widget? child) {
                  return ForgotPasswordChoiceChipWidget(
                    icon: Icons.mail,
                    tile: "via Email",
                    subtitle: "+91 9207****46",
                    isSelected: value.emailSelected,
                    borderColor: forgotPasswordController.emailSelected
                        ? AppColors.whiteColor
                        : AppColors.transparent,
                    onTap: () {
                      value.setEmailSelection();
                    },
                  );
                }),
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
