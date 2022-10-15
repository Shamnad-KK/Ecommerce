import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const buttonBlackText = TextStyle(
    color: AppColors.blackColor,
    fontSize: 14,
  );
  static const bodyText1 = TextStyle(
    fontSize: 14,
  );

  static const appbarTextStyle = TextStyle(
    fontSize: 15,
    //fontWeight: FontWeight.bold,
  );

  static const whiteLargeTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );

  static const whiteMediumTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const dullWhiteNormalTextStyle = TextStyle(
    color: AppColors.dullWhite,
    fontSize: 14,
  );
}
