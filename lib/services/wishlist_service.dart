import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/wishlist_model.dart';

import '../config/app_config.dart';

class WishListService {
  Future<int?> addOrRemoveWishlist(String productId) async {
    try {
      DioInterceptor dioInterceptor = DioInterceptor();
      Dio dio = await dioInterceptor.getDioInstance();
      const url = "http://${AppUrls.host}:6000/api/v1/wishlist";
      Response response = await dio.post(
        url,
        data: {
          "product": productId,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.statusCode;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<List<WishlistProductElement>?> getAllWishlist() async {
    try {
      DioInterceptor dioInterceptor = DioInterceptor();
      Dio dio = await dioInterceptor.getDioInstance();
      const url = "http://${AppUrls.host}:6000/api/v1/wishlist";
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        }
        log(response.data["products"].toString());
        final List<WishlistProductElement> wishList =
            (response.data["products"] as List)
                .map((e) => WishlistProductElement.fromJson(e))
                .toList();
        return wishList;
      }
      if (response.statusCode! == 204) {
        return <WishlistProductElement>[];
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
