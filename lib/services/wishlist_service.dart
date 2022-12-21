import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/wishlist_model.dart';

class WishListService {
  Future<bool> addToWishlist(String productId) async {
    try {
      Dio dio = Dio();
      const url = "http://${AppUrls.host}:6000/api/v1/wishlist";
      Response response = await dio.post(
        url,
        data: {
          "productId": productId,
        },
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
      Response response = await dio.get(
        url,
      );
      if (response.statusCode! == 200) {
        final List<WishlistProductElement> wishList = (response.data as List)
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

  Future<bool> removeFromWishlist(String productId) async {
    try {
      Dio dio = Dio();
      final url = "http://${AppUrls.host}:6000/api/v1/wishlist/$productId";
      Response response = await dio.delete(
        url,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {}
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }
}
