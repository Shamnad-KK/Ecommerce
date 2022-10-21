import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    DateTime? dateTime;
    dateTime = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              brightness: Brightness.light,
              primary: AppColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return dateTime;
  }
}
