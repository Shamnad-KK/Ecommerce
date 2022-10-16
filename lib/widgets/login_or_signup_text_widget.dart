import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class LoginOrSignUpTextWidget extends StatelessWidget {
  const LoginOrSignUpTextWidget({
    Key? key,
    required this.leadingText,
    required this.mainText,
    required this.onTap,
  }) : super(key: key);
  final String leadingText;
  final String mainText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: AppTextStyle.dullWhiteNormalTextStyle,
        ),
        AppSpacing.kWidth10,
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            mainText,
            style: AppTextStyle.bodyText1,
          ),
        ),
      ],
    );
  }
}
