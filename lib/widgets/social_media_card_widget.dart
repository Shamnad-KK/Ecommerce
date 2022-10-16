import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class SocialMediaCardWidget extends StatelessWidget {
  const SocialMediaCardWidget({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: 90,
        decoration: BoxDecoration(
          color: AppColors.mediaButtonBg,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
