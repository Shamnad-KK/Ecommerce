import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/auth_token_model.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServices {
  Future<AuthTokenModel?> login(
      BuildContext context, LoginModel loginModel) async {
    try {
      //LoginModel? model;
      Dio dio = Dio();

      const url = "http://${AppUrls.host}:6000/api/v1/auth/login";

      final Response<Map<String, dynamic>> response = await dio.post(
        url,
        data: loginModel.toJson(),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        return AuthTokenModel.fromJson(response.data!);

        // if (response.data!['token'] != null && response.data!['token'] != '') {
        //   final String token = response.data!['token'];

        //   PreferenceManager manager =
        //       PreferenceManager(await SharedPreferences.getInstance());

        //   manager.token = token;

        //   return LoginModel.fromJson(response.data!);

        // }
      } else {
        log("Error with status code ${response.statusCode.toString()}");
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<GoogleSignInAccount?> signinWithGoogle() async {
    try {
      GoogleSignInAccount? account;
      account = await GoogleSignIn().signIn();

      if (account != null) {
        return account;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
