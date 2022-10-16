import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/widgets/social_media_container_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/login_or_signup_text_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.mainPading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.transparent,
                    backgroundImage: AssetImage("assets/welcome/circle.png"),
                  ),
                  AppSpacing.kHeight30,
                  const Text(
                    "Let's you in",
                    style: AppTextStyle.whiteLargeTextStyle,
                  ),
                  AppSpacing.kHeight30,
                  SocialMediaContainerWidget(
                    image: "assets/social_media_icons/facebook-logo-3-1.png",
                    text: "Continue with Facebook",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight10,
                  SocialMediaContainerWidget(
                    image: "assets/social_media_icons/google-logo.png",
                    text: "Continue with Google",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight30,
                  const Text(
                    "or",
                    style: AppTextStyle.bodyText1,
                  ),
                  AppSpacing.kHeight30,
                  CustomButtonWidget(
                    text: "Sign in with password",
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.loginScreen);
                    },
                  ),
                  AppSpacing.kHeight30,
                  LoginOrSignUpTextWidget(
                    leadingText: "Don't have an account?",
                    mainText: "Sign up",
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.signUpScreen);
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
