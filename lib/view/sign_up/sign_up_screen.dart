import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:ecommerce/widgets/login_or_signup_text_widget.dart';
import 'package:ecommerce/widgets/social_media_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create your\naccount",
                    style: AppTextStyle.headline3,
                  ),
                  AppSpacing.kHeight30,
                  CustomTextField(
                    controller: signUpController.userNameController,
                    hint: "Username",
                    keyboardType: TextInputType.emailAddress,
                    filled: true,
                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      color: AppColors.prefixIconColor,
                      size: 18,
                    ),
                  ),
                  AppSpacing.kHeight10,
                  CustomTextField(
                    controller: signUpController.emailController,
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    filled: true,
                    prefixIcon: const Icon(
                      CupertinoIcons.mail,
                      color: AppColors.prefixIconColor,
                      size: 18,
                    ),
                  ),
                  AppSpacing.kHeight10,
                  CustomTextField(
                    controller: signUpController.phoneController,
                    hint: "Phone",
                    keyboardType: TextInputType.number,
                    filled: true,
                    prefixIcon: const Icon(
                      CupertinoIcons.phone,
                      color: AppColors.prefixIconColor,
                      size: 18,
                    ),
                  ),
                  AppSpacing.kHeight10,
                  Consumer<SignUpController>(
                      builder: (BuildContext context, value, Widget? child) {
                    return CustomTextField(
                      controller: signUpController.passwordController,
                      hint: "Password",
                      obscureText: value.isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.prefixIconColor,
                        size: 18,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          value.setObscureTextVisibility();
                        },
                        child: Icon(
                          value.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.suffixIconColor,
                          size: 18,
                        ),
                      ),
                    );
                  }),
                  AppSpacing.kHeight30,
                  CustomButtonWidget(
                    text: "Sign up",
                    onTap: () {
                      final args = OtpArguments(otpAction: OtpAction.SIGN_UP);
                      Navigator.pushNamed(context, RouteNames.otpScreen,
                          arguments: args);
                    },
                  ),
                  AppSpacing.kHeight30,
                  const Text(
                    "or continue with",
                    style: AppTextStyle.body2,
                  ),
                  AppSpacing.kHeight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaCardWidget(
                        image: "assets/social_media_icons/google-logo.png",
                        onTap: () {},
                      ),
                      AppSpacing.kWidth10,
                      SocialMediaCardWidget(
                        image:
                            "assets/social_media_icons/facebook-logo-3-1.png",
                        onTap: () {},
                      ),
                    ],
                  ),
                  AppSpacing.kHeight30,
                  LoginOrSignUpTextWidget(
                    leadingText: "Already have an account?",
                    mainText: "Sign in",
                    onTap: () {
                      Navigator.of(context).pop();
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
