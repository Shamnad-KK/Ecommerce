import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllCategories();
    getAllProducts();
  }
  HomeServices homeServices = HomeServices();

  bool isLoading = false;

  Products? products;

  num offerPrice = 0;
  num actualPrice = 0;

  List<HomeCategoryModel> categoryList = [];

  void getAllCategories() async {
    isLoading = true;
    notifyListeners();
    await homeServices.getAllCategories().then((value) {
      if (value.isNotEmpty) {
        categoryList = value;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void getAllProducts() async {
    isLoading = true;
    notifyListeners();
    await homeServices.getAllProducts().then((value) {
      if (value != null) {
        products = value;
      }
    });
    isLoading = false;
    notifyListeners();
    //log(products?.count.toString() ?? "null");
  }

  void calculatePrice(ProductElement product) {
    if (products != null) {
      offerPrice = product.price! * product.offer! / 100;
      actualPrice = product.price! - offerPrice;
    }
  }

  void setFavorite(int index) {
    // productList[index].isFavorite = !productList[index].isFavorite;
    // notifyListeners();
    // log(productList[index].isFavorite.toString());
  }
}
