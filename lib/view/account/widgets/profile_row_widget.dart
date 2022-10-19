import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              AppSpacing.kWidth10,
              Text(
                text,
                style: AppTextStyle.body1,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
              )
            ],
          ),
          AppSpacing.kHeight20,
        ],
      ),
    );
  }
}
