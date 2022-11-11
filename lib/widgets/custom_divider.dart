import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppSpacing.kHeight10,
        Divider(
          color: AppColors.whiteColor,
        ),
        AppSpacing.kHeight10,
      ],
    );
  }
}
