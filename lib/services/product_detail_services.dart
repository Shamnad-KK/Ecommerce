import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductDetailServices {
  Future<ProductElement?> getOneProduct(String productId) async {
    try {
      Dio dio = Dio();
      final url = "http://${AppUrls.host}:6000/api/v1/products/$productId";
      Response response = await dio.get(
        url,
      );
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
