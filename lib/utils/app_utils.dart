import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    DateTime? dateTime;
    dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return dateTime;
  }

  static Country? pickCountry(BuildContext context) {
    Country? country;
    showCountryPicker(
      context: context,
      onSelect: (Country? newCountry) {
        country = newCountry;
      },
    );
    return country;
  }
}
