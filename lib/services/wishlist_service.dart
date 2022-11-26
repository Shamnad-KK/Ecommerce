import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/preference_manager.dart';
import 'package:ecommerce/model/wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListService {
  Future<bool> addToWishlist(String productId) async {
    try {
      Dio dio = Dio();
      const url = "http://${AppUrls.host}:6000/api/v1/wishlist";
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = await manager.getToken();
      Response response = await dio.post(
        url,
        data: {
          "productId": productId,
        },
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        if (response.data["success"] == true) {
          return true;
        }
        return false;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }

  Future<List<WishlistProductElement>?> getAllWishlist() async {
    try {
      Dio dio = Dio();
      const url = "http://${AppUrls.host}:6000/api/v1/wishlist";
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = await manager.getToken();
      Response response = await dio.get(
        url,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final wishList = (response.data as List)
            .map((e) => WishlistProductElement.fromJson(e))
            .toList();
        return wishList;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<bool> removeFromWishlist(String productId) async {
    try {
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());
      final token = await manager.getToken();
      Dio dio = Dio();
      final url = "http://${AppUrls.host}:6000/api/v1/wishlist/$productId";
      Response response = await dio.delete(url,
          options: Options(headers: AppConfig.getApiHeader(token: token)));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {}
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }
}
