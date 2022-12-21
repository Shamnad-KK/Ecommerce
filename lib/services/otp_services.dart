import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';

class OtpServices {
  Dio dio = Dio();
  Future<String?> sendOtp(String email) async {
    try {
      // const url = AppUrls.mainUrl + ApiEndPoints.sendOtp;
      Response response = await dio.get(
        "http://${AppUrls.host}:6000/api/v1/auth/otp",
        queryParameters: {"email": email},
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["message"];
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<String?> verifyOtp(String email, String otp) async {
    try {
      Response response = await dio.post(
        "http://${AppUrls.host}:6000/api/v1/auth/otp",
        data: {"email": email, "otp": otp},
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
  // Future<RegisterOtpVerificationModel?> verifySignUpOtp(
  //     RegisterOtpVerificationModel model,
  //     BuildContext context,
  //     String code) async {
  //   try {
  //     RegisterOtpVerificationModel? registerOtpVerificationModel;
  //     const url = "http://${AppUrls.host}:6000/api/v1/verify";
  //     log(model.toJson().toString());
  //     final response = await dio.post(
  //       url,
  //       data: {"user": model.toJson(), "code": code},
  //       options: Options(headers: AppConfig.getApiHeader(token: null)),
  //     );
  //     if (response.statusCode! >= 200 && response.statusCode! <= 299) {
  //       final PreferenceManager sharedPreference =
  //           PreferenceManager(await SharedPreferences.getInstance());

  //       if (response.data["token"] != null && response.data["token"] != '') {
  //         //Saving token to the authorization key
  //         sharedPreference.token = response.data["token"];

  //         log(response.statusCode.toString());
  //         registerOtpVerificationModel =
  //             RegisterOtpVerificationModel.fromJson(response.data);
  //         return registerOtpVerificationModel;
  //       }
  //     } else {
  //       log("Error with status code ${response.statusCode.toString()}");
  //     }
  //   } catch (e) {
  //     AppExceptions.handleError(e);
  //   }
  //   return null;
  // }

  // Future<String?> verifyForgotPasswordOtp(
  //     VerifyForgotPasswordModel model) async {
  //   try {
  //     const url = "http://${AppUrls.host}:6000/api/v1/verifyOtp";
  //     final response = await dio.post(
  //       url,
  //       data: json.encode(model.toJson()),
  //       options: Options(headers: AppConfig.getApiHeader(token: null)),
  //     );
  //     if (response.statusCode! >= 200 && response.statusCode! <= 299) {
  //       log(response.data.toString());

  //       if (response.data["message"] == "OTP verification success") {
  //         return response.data["message"];
  //       }
  //     }
  //   } catch (e) {
  //     AppExceptions.handleError(e);
  //   }
  //   return null;
  // }
}
