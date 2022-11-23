import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/cart_add.dart';
import 'package:ecommerce/model/cart_products.dart';

class CartService {
  Future<bool?> addToCart(CartModel cartModel) async {
    const userId = '6364a8cdb6450317f86d52cf';
    const url = 'http://${AppUrls.host}:6000/api/v1/products/cart/$userId';
    try {
      Dio dio = Dio();
      Response response = await dio.post(url, data: cartModel.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["success"];
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<CartProducts?> getAllProducts() async {
    const userId = '6364a8cdb6450317f86d52cf';
    const url = 'http://${AppUrls.host}:6000/api/v1/products/cart/$userId';
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
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
