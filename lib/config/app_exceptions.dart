import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/services.dart';

class AppExceptions {
  static void handleError(Object exception) {
    if (exception is DioError) {
      if (exception.response?.data['message'] != null) {
        AppPopUps.showToast(
          exception.response!.data["message"],
          AppColors.errorColor,
        );
      } else if (exception.error is SocketException) {
        AppPopUps.showToast(
            "Please check your connection", AppColors.errorColor);
      } else if (exception.error is PlatformException) {
        AppPopUps.showToast("Platform Exception", AppColors.errorColor);
      } else if (exception.type == DioErrorType.cancel) {
        AppPopUps.showToast("Request cancelled", AppColors.errorColor);
      } else if (exception.type == DioErrorType.connectTimeout) {
        AppPopUps.showToast("Connection time out", AppColors.errorColor);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        AppPopUps.showToast("Recieve time out", AppColors.errorColor);
      } else if (exception.type == DioErrorType.sendTimeout) {
        AppPopUps.showToast("Send time out", AppColors.errorColor);
      } else if (exception.type == DioErrorType.other) {
        AppPopUps.showToast("Error Occured", AppColors.errorColor);
      } else if (exception.type == DioErrorType.response) {
        AppPopUps.showToast("Response Error occured", AppColors.errorColor);
      }
    }
    if (exception is SocketException) {
      AppPopUps.showToast("Please check your connection", AppColors.errorColor);
    }
    if (exception is TimeoutException) {
      AppPopUps.showToast("Time out", AppColors.errorColor);
    } else if (exception is PlatformException) {
      AppPopUps.showToast(exception.message.toString(), AppColors.errorColor);
    } else if (exception.toString() == "Failed host lookup: 'geocode.xyz'") {
      // log('geocode-dont worry');
    } else if (exception.toString() ==
        "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
      AppPopUps.showToast(
          "Failed to fetch location automatically, Please try again",
          AppColors.errorColor);
    } else {
      log('message');
      AppPopUps.showToast(exception.toString(), AppColors.errorColor);
      log(exception.toString());
    }
  }
}
