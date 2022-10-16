import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordChoiceChipWidget extends StatelessWidget {
  const ForgotPasswordChoiceChipWidget({
    Key? key,
    required this.tile,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.borderColor,
  }) : super(key: key);

  final String tile;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: ChoiceChip(
        padding: EdgeInsets.zero,
        selected: isSelected,
        backgroundColor: AppColors.mediaButtonBg,
        selectedColor: AppColors.mediaButtonBg,
        disabledColor: AppColors.mediaButtonBg,
        side: BorderSide(
          color: borderColor,
        ),
        label: SizedBox(
          width: size.width,
          child: Padding(
            padding: AppPadding.mainPading,
            child: ListTile(
              leading: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              title: Text(
                tile,
                style: AppTextStyle.bodySmallText,
              ),
              subtitle: Text(
                subtitle,
                style: AppTextStyle.bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
