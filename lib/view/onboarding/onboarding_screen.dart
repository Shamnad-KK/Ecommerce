import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: AppPadding.mainSidePading,
            child: CustomButtonWidget(
              text: "Get Started",
              inverted: true,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.loginScreen);
              },
            ),
          ),
          AppSpacing.kHeight50,
        ],
      ),
    );
  }
}
