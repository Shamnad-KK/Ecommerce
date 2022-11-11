import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_padding.dart';
import '../helpers/apptext_style.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding = AppPadding.buttonPadding,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: padding,
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.whiteColor)),
        child: Text(
          text,
          style: AppTextStyle.body2,
        ),
      ),
    );
  }
}
