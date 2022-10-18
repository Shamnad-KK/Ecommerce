import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const buttonBlackText = TextStyle(
    color: AppColors.blackColor,
    fontSize: 14,
  );
  static const body1 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
  );
  static const body2 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 14,
  );

  static const titleLarge = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 22,
    // fontWeight: FontWeight.bold,
  );

  static const titleMedium = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.whiteColor,
  );

  static const labelSmall = TextStyle(
    fontSize: 11,
    color: AppColors.whiteColor,
  );

  //Used for Appbar
  static const headLine6 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //Used for main large headlines in Welcome screen
  static const headline3 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );

  static const headline4 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const subtitle1 = TextStyle(
    color: AppColors.dullWhite,
    fontSize: 16,
  );

  static const subtitle2 = TextStyle(
    color: AppColors.dullWhite,
    fontSize: 14,
  );

  static const hintTextStyle = TextStyle(
    color: AppColors.hintTextColor,
    fontSize: 14,
  );
}
