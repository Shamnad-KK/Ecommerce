import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create your\naccount",
                    style: AppTextStyle.headline3,
                  ),
                  AppSpacing.kHeight30,
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
                  AppSpacing.kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<SignUpController>(
                        builder: (BuildContext context, signUpConsumer,
                            Widget? child) {
                          return Checkbox(
                            value: signUpConsumer.isChecked,
                            activeColor: AppColors.mainColor,
                            onChanged: (value) {
                              signUpConsumer.setCheckVisibility(value!);
                            },
                          );
                        },
                      ),
                      const Text(
                        "Remember me",
                        style: AppTextStyle.bodySmall,
                      )
                    ],
                  ),
                  AppSpacing.kHeight10,
                  CustomButtonWidget(
                    text: "Sign up",
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RouteNames.accountSetupScreen, (route) => false);
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
                        image:
                            "assets/social_media_icons/facebook-logo-3-1.png",
                        onTap: () {},
                      ),
                      AppSpacing.kWidth10,
                      SocialMediaCardWidget(
                        image: "assets/social_media_icons/google-logo.png",
                        onTap: () {},
                      ),
                    ],
                  ),
                  AppSpacing.kHeight30,
                  LoginOrSignUpTextWidget(
                    leadingText: "Already have an account?",
                    mainText: "Sign in",
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.loginScreen);
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
