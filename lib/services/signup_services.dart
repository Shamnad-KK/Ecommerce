import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpServices {
  Dio dio = Dio();
  Future<UserModel?> registerUser(UserModel user, BuildContext context) async {
    try {
      //final url = AppUrls.mainUrl + ApiEndPoints.register;
      final url = "http://${AppUrls.host}:6000/api/v1/register";

      log(url.toString());

      Response response = await dio.post(
        url,
        data: json.encode(user.toJson()),
        options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return UserModel.fromJson(response.data);
      } else {
        log("Error with status code ${response.data.toString()}");
      }
    } catch (e) {
      log("catch");
      AppExceptions.handleError(e);
    }
    return null;
  }
}
