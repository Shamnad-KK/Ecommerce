import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';
import '../helpers/preference_manager.dart';

class ProductFilterService {
  Future<List<ProductElement>?> getProductsByCategory(String categoryId) async {
    log(categoryId);
    try {
      Dio dio = Dio();
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());

      final token = await manager.getToken();
      final url =
          "http://${AppUrls.host}:6000/api/v1/products/?category=$categoryId";
      Response response = await dio.get(
        url,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List<ProductElement> result = (response.data as List)
            .map((e) => ProductElement.fromJson(e))
            .toList();

        return result;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
