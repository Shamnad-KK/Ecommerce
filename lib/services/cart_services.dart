import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/cart_add.dart';
import 'package:ecommerce/model/cart_products.dart';

class CartService {
  Future<bool?> addToCart(CartModel cartModel) async {
    const url = 'http://${AppUrls.host}:6000/api/v1/cart';
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        url,
        data: cartModel.toJson(),
        options: Options(),
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
      Response response = await dio.get(
        url,
      );
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
