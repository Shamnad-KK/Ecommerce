import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/sign_up_model.dart';

class ForgetPasswordServices {
  Future<UserModel?> userCheck(String email) async {
    try {
      Dio dio = Dio();

      Response response = await dio.get(
        "http://${AppUrls.host}:6000/api/v1/users/",
        queryParameters: {'email': email},
      );
      log('usercheck');

      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        return userModel;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
