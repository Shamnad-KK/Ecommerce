import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static const String dummyImage =
      'https://rukminim1.flixcart.com/image/832/832/kbb49zk0/jean/f/z/a/38-bmw-darklevis-d-ben-martin-original-imafszrt2eye6n7b.jpeg?q=70';
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
