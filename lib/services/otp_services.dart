import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/register_otp_verification_model.dart';
import 'package:ecommerce/model/verify_forgot_password_model.dart';
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
      const url = "http://${AppUrls.host}:6000/api/v1/verify";
      log(model.toJson().toString());
      final response = await dio.post(
        url,
        data: {"user": model.toJson(), "code": code},
        options: Options(headers: AppConfig.getApiHeader(token: null)),
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

  Future<String?> verifyForgotPasswordOtp(
      VerifyForgotPasswordModel model) async {
    try {
      const url = "http://${AppUrls.host}:6000/api/v1/verifyOtp";
      final response = await dio.post(
        url,
        data: json.encode(model.toJson()),
        options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        if (response.data["message"] == "OTP verification success") {
          return response.data["message"];
        }
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
