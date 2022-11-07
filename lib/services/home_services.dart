import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/home_category_model.dart';

class HomeServices {
  Future<List<HomeCategoryModel>> getAllCategories() async {
    List<HomeCategoryModel> categoryList = [];
    try {
      Dio dio = Dio();
      //const url = AppUrls.mainUrl + ApiEndPoints.allCategories;
      Response response =
          await dio.get("http://${AppUrls.host}:6000/api/v1/admin/categories");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List data = response.data;
        categoryList = data.map((e) {
          log(e.toString());
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
}
