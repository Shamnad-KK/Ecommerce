import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class SocialMediaContainerWidget extends StatelessWidget {
  const SocialMediaContainerWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: AppPadding.verticalPading15,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.mediaButtonBg,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.transparent,
              radius: 10,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            AppSpacing.kWidth10,
            Text(
              text,
              style: AppTextStyle.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
