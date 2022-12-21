import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/auth_token_model.dart';
import 'package:ecommerce/model/sign_up_model.dart';

class SignUpServices {
  Dio dio = Dio();
  Future<AuthTokenModel?> signUp(UserModel user) async {
    try {
      log('kuuy');
      Response response = await dio.post(
        "http://${AppUrls.host}:6000/api/v1/auth/signup",
        data: user.toJson(),
      );
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return AuthTokenModel.fromJson(response.data);
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
