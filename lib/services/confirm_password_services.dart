import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/confirm_passwordmodel.dart';

class ConfirmPasswordServices {
  Future<String?> confirmNewPassword(CreateNewPasswordModel model) async {
    try {
      Dio dio = Dio();

      const url = "http://${AppUrls.host}:6000/api/v1/auth/password";
      Response response = await dio.post(
        url,
        data: model.toJson(),
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
