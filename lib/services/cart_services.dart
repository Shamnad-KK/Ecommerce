import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/cart_add.dart';
import 'package:ecommerce/model/cart_products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  Future<bool?> addToCart(CartModel cartModel) async {
    const url = 'http://${AppUrls.host}:6000/api/v1/cart';
    try {
      Dio dio = Dio();
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());

      final token = await manager.getToken();
      Response response = await dio.post(
        url,
        data: cartModel.toJson(),
        options: Options(
          headers: AppConfig.getApiHeader(token: token),
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["success"];
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<CartProducts?> getAllCartProducts() async {
    const url = 'http://${AppUrls.host}:6000/api/v1/cart';
    try {
      Dio dio = Dio();
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());

      final token = await manager.getToken();
      Response response = await dio.get(url,
          options: Options(headers: AppConfig.getApiHeader(token: token)));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("cart fetching success");
        return CartProducts.fromJson(response.data);
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
