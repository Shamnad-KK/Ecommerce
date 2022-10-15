import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/view/login/widgets/social_media_signin_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    backgroundImage: AssetImage("assets/login/circle.png"),
                  ),
                  AppSpacing.kHeight30,
                  const Text(
                    "Let's you in",
                    style: AppTextStyle.whiteLargeTextStyle,
                  ),
                  AppSpacing.kHeight30,
                  SocialMediaSignInWidget(
                    image: "assets/social_media_icons/facebook-logo-3-1.png",
                    text: "Continue with Facebook",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight10,
                  SocialMediaSignInWidget(
                    image: "assets/social_media_icons/google-logo.png",
                    text: "Continue with Google",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight30,
                  const Text("or"),
                  AppSpacing.kHeight30,
                  CustomButtonWidget(
                    text: "Sign in with password",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account?",
                        style: AppTextStyle.dullWhiteNormalTextStyle,
                      ),
                      AppSpacing.kWidth10,
                      Text(
                        "Sign up",
                        style: AppTextStyle.bodyText1,
                      ),
                    ],
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
