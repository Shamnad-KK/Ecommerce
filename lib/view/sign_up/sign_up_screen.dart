import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //   "Create your\naccount",
                    //   style: AppTextStyle.headline3,
                    // ),
                    // AppSpacing.kHeight30,
                    CustomTextField(
                      controller: signUpController.userNameController,
                      hint: "Username",
                      validator: (p0) =>
                          signUpController.usernameValidation(p0),
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
                      validator: (p0) => signUpController.emailValidation(p0),
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
                      validator: (p0) => signUpController.phoneValidation(p0),
                      keyboardType: TextInputType.phone,
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
                        validator: (p0) =>
                            signUpController.passwordValidation(p0),
                        hint: "Password",
                        obscureText: value.isObscure,
                        keyboardType: TextInputType.text,
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
                    CustomTextField(
                      controller: signUpController.confirmPasswordController,
                      hint: "Confirm Password",
                      validator: (p0) =>
                          signUpController.confirmPasswordValidation(p0),
                      keyboardType: TextInputType.text,
                      filled: true,
                      prefixIcon: const Icon(
                        CupertinoIcons.phone,
                        color: AppColors.prefixIconColor,
                        size: 18,
                      ),
                    ),
                    AppSpacing.kHeight30,
                    Consumer<SignUpController>(
                      builder: (context, value, child) {
                        return value.isLoading
                            ? const CustomLoadingWidget()
                            : CustomButtonWidget(
                                text: "Sign up",
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    await signUpController
                                        .registerUser(context);
                                  }
                                },
                              );
                      },
                    ),
                    AppSpacing.kHeight30,
                    const Text(
                      "or continue with",
                      style: AppTextStyle.body2,
                    ),
                    AppSpacing.kHeight30,
                    SocialMediaCardWidget(
                      image: "assets/social_media_icons/google-logo.png",
                      onTap: () {},
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
      ),
    );
  }
}
