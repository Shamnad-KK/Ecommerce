import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const customButtonBlackStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const customButtonWhiteStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const appbarTextStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 15,
    //fontWeight: FontWeight.bold,
  );

  static const whiteLargeTextStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );
}
