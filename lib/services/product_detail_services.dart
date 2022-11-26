import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/preference_manager.dart';

class ProductDetailServices {
  Future<ProductElement?> getOneProduct(String productId) async {
    try {
      Dio dio = Dio();
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());

      final token = await manager.getToken();
      final url = "http://${AppUrls.host}:6000/api/v1/products/$productId";
      Response response = await dio.get(url,
          options: Options(headers: AppConfig.getApiHeader(token: token)));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return ProductElement.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
