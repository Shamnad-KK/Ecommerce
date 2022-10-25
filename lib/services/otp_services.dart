// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/register_otp_verification_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpServices {
  Dio dio = Dio();
  Future<void> verifySignUpOtp(
      RegisterOtpVerificationModel model, BuildContext context) async {
    const url = "http://172.16.1.212:5000/api/v1/verifyOtp";
    final response = await dio.post(
      url,
      data: jsonEncode(model.toJson()),
      queryParameters: AppConfig.getApiHeader(token: null),
    );
    try {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final PreferenceManager sharedPreference =
            PreferenceManager(await SharedPreferences.getInstance());

        if (response.data["token"] != null && response.data["token"] != '') {
          //Saving token to the authorization key
          sharedPreference.token = response.data["token"];

          log(response.data.toString());
          await Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNames.bottomNavBar,
            (route) => false,
          );
          AppPopUps.showToast(
              "Registered successfully, Please log in", Colors.green);
        }
      } else {
        log("Error with status code ${response.statusCode.toString()}");
      }
    } catch (e) {
      log("Error with status code ${response.statusCode.toString()}");
      AppPopUps.showToast(e.toString(), Colors.red);
    }
  }
}
