import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';

class ForgetPasswordServices {
  Future<String?> getOtp(String email) async {
    try {
      Dio dio = Dio();

      final url = "http://${AppUrls.host}:6000/api/v1/accounts/password";
      Response response = await dio.post(
        url,
        data: {"email": email},
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["message"];
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
