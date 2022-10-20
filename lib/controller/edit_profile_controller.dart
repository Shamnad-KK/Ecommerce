import 'package:ecommerce/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? dropDownValue;

  DateTime? dateTime;

  String? code;

  void setDropDownValue(String value) {
    dropDownValue = value;
    notifyListeners();
  }

  void pickDate(BuildContext context) async {
    dateTime = await AppUtils.pickDateTime(context);
    if (dateTime != null) {
      dateController.text = DateFormat.yMMMMd().format(dateTime!);
    }
  }

  // void pickCountry(BuildContext context) {
  //   showCountryPicker(
  //     context: context,
  //     showPhoneCode: true,
  //     countryListTheme:
  //         const CountryListThemeData(textStyle: AppTextStyle.bodyText1),
  //     onSelect: (Country? newCountry) {
  //       country = newCountry;
  //     },
  //   );
  //   // country = AppUtils.pickCountry(context);
  //   if (country != null) {
  //     log("message");
  //     code = "+${country!.phoneCode}";
  //     log(code ?? "x");
  //   }
  //   notifyListeners();
  // }
}
