import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/confirm_passwordmodel.dart';

class ConfirmPasswordServices {
  Future<String?> confirmNewPassword(CreateNewPasswordModel model) async {
    try {
      Dio dio = Dio();

      final url = "http://${AppUrls.host}:6000/api/v1/accounts/password";
      Response response = await dio.put(
        url,
        data: model.toJson(),
        options: Options(headers: AppConfig.getApiHeader(token: null)),
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
