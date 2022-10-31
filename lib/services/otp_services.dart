import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/register_otp_verification_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpServices {
  Dio dio = Dio();
  Future<RegisterOtpVerificationModel?> verifySignUpOtp(
      RegisterOtpVerificationModel model,
      BuildContext context,
      String code) async {
    try {
      RegisterOtpVerificationModel? registerOtpVerificationModel;
      final url = "http://${AppUrls.host}:6000/api/v1/verify";
      final response = await dio.post(
        url,
        data: {"user": model.toJson(), "code": code},
        queryParameters: AppConfig.getApiHeader(token: null),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final PreferenceManager sharedPreference =
            PreferenceManager(await SharedPreferences.getInstance());

        if (response.data["token"] != null && response.data["token"] != '') {
          //Saving token to the authorization key
          sharedPreference.token = response.data["token"];

          log(response.statusCode.toString());
          registerOtpVerificationModel =
              RegisterOtpVerificationModel.fromJson(response.data);
          return registerOtpVerificationModel;
        }
      } else {
        log("Error with status code ${response.statusCode.toString()}");
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
