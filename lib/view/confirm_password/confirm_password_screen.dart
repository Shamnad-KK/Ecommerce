import 'package:ecommerce/controller/confirm_password_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Password"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.35,
                  width: size.width,
                  child: Image.asset(
                      "assets/confirm_password/confirm_password.png"),
                ),
                AppSpacing.kHeight30,
                Text(
                  "Create your new password",
                  style: AppTextStyle.headLine6
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                AppSpacing.kHeight30,
                CustomTextField(
                  hint: "Password",
                  obscureText:
                      context.read<ConfirmPasswordController>().isObscure,
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.whiteColor,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      context
                          .read<ConfirmPasswordController>()
                          .setObscureTextVisibility();
                    },
                    child: Icon(
                      context.watch<ConfirmPasswordController>().isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.suffixIconColor,
                      size: 18,
                    ),
                  ),
                ),
                AppSpacing.kHeight30,
                CustomButtonWidget(
                  text: "Continue",
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNames.bottomNavBar, (route) => false);
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
