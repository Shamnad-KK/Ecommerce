import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainSidePading,
          child: Column(
            children: const [
              Padding(
                padding: AppPadding.largeSidePading,
                child: Text(
                  "Welcome\nback",
                  style: AppTextStyle.whiteLargeTextStyle,
                ),
              ),
              // Container(height: ,)
            ],
          ),
        ),
      ),
    );
  }
}
