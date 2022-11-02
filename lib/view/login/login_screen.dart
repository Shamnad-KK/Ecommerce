import 'package:ecommerce/controller/login_controller.dart';
import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:ecommerce/widgets/login_or_signup_text_widget.dart';
import 'package:ecommerce/widgets/social_media_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login to your\naccount",
                      style: AppTextStyle.headline3,
                    ),
                    AppSpacing.kHeight30,
                    CustomTextField(
                      controller: loginController.emailController,
                      hint: "Email",
                      validator: (value) =>
                          loginController.emailValidation(value),
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
                        controller: loginController.passwordController,
                        hint: "Password",
                        validator: (value) =>
                            loginController.passwordValidation(value),
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
                    GestureDetector(
                      onTap: () {
                        final args =
                            OtpArguments(otpAction: OtpAction.FORGOT_PASSWORD);
                        Navigator.pushNamed(
                            context, RouteNames.forgotPasswordScreen,
                            arguments: args);
                      },
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot the password?",
                          style: AppTextStyle.body2,
                        ),
                      ),
                    ),
                    AppSpacing.kHeight30,
                    Consumer<LoginController>(
                      builder: (BuildContext context, value, Widget? child) {
                        return value.isLoading
                            ? const CustomLoadingWidget()
                            : CustomButtonWidget(
                                text: "Sign in",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    value.login(context);
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
                      onTap: () {
                        loginController.signinWithGoogle();
                      },
                    ),
                    AppSpacing.kHeight30,
                    LoginOrSignUpTextWidget(
                      leadingText: "Don't have an account?",
                      mainText: "Sign up",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteNames.signUpScreen);
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
