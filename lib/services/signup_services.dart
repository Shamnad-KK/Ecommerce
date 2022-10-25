// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/sign_up_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/otp/otp_arguments.dart';
import 'package:ecommerce/view/otp/utils/otp_enums.dart';
import 'package:flutter/material.dart';

class SignUpServices {
  Dio dio = Dio();
  Future<void> registerUser(UserModel userModel, BuildContext context) async {
    try {
      //final url = AppUrls.mainUrl + ApiEndPoints.register;
      final url = "http://${AppUrls.host}:5000/api/v1/register";

      log(url.toString());
      final Response<dynamic> response = await dio.post(
        url,
        data: json.encode(
          userModel.toJson(),
        ),
        queryParameters: AppConfig.getApiHeader(token: null),
      );
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final args = OtpArguments(otpAction: OtpAction.SIGN_UP);
        Navigator.of(context).pushNamed(RouteNames.otpScreen, arguments: args);
        log(response.statusCode.toString());
      } else {
        log("Error with status code ${response.data.toString()}");
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
  }
}
