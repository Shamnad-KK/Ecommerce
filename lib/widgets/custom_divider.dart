import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.color = AppColors.whiteColor,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.kHeight10,
        Divider(
          color: color,
        ),
        AppSpacing.kHeight10,
      ],
    );
  }
}
