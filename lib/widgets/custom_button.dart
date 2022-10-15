import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.inverted = false,
  });
  final String text;
  final VoidCallback onTap;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: inverted ? Colors.white : AppColors.customButtonColor,
        side: const BorderSide(color: Colors.black, width: 0.1),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style: inverted
            ? AppTextStyle.customButtonBlackStyle
            : AppTextStyle.customButtonWhiteStyle,
      ),
    );
  }
}
