import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_config.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/carousal_model.dart';
import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/preference_manager.dart';

class HomeServices {
  Future<List<HomeCategoryModel>> getAllCategories() async {
    List<HomeCategoryModel> categoryList = [];
    PreferenceManager manager =
        PreferenceManager(await SharedPreferences.getInstance());

    final token = await manager.getToken();
    try {
      Dio dio = Dio();
      //const url = AppUrls.mainUrl + ApiEndPoints.allCategories;
      Response response = await dio.get(
          "http://${AppUrls.host}:6000/api/v1/admin/categories",
          options: Options(headers: AppConfig.getApiHeader(token: token)));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List data = response.data;
        categoryList = data.map((e) {
          //log(e.toString());
          return HomeCategoryModel.fromJson(e);
        }).toList();
        return categoryList;
      } else {
        log("Error with status code ${response.statusCode.toString()}");
        return <HomeCategoryModel>[];
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return <HomeCategoryModel>[];
  }

  Future<List<ProductElement>?> getAllProducts() async {
    try {
      Dio dio = Dio();
      PreferenceManager manager =
          PreferenceManager(await SharedPreferences.getInstance());

      final token = await manager.getToken();
      const url = "http://${AppUrls.host}:6000/api/v1/products";
      Response response = await dio.get(url,
          options: Options(headers: AppConfig.getApiHeader(token: token)));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('get all product response success');

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

  Future<List<Carrousals>?> getCarousal() async {
    try {
      Dio dio = Dio();
      const url = "http://${AppUrls.host}:6000/api/v1/admin/carousal";
      Response response = await dio.get(url);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        List<Carrousals> carousalList = (response.data['carousals'] as List)
            .map((e) => Carrousals.fromJson(e))
            .toList();
        return carousalList;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
