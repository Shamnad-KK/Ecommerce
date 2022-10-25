// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  Future<void> login(BuildContext context, LoginModel loginModel) async {
    Dio dio = Dio();
    try {
      final url = "http://${AppUrls.host}:5000/api/v1/login";
      final Response<Map<String, dynamic>> response = await dio.post(url,
          data: jsonEncode(loginModel.toJson()),
          queryParameters: AppConfig.getApiHeader(token: null));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        if (response.data!['token'] != null && response.data!['token'] != '') {
          final String token = response.data!['token'];
          PreferenceManager manager =
              PreferenceManager(await SharedPreferences.getInstance());
          manager.token = token;
          await Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.bottomNavBar, (route) => false);
        }
      } else {
        log("Error with status code ${response.statusCode.toString()}");
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
  }
}
