import 'package:ecommerce/model/carousal_model.dart';
import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:ecommerce/view/product_detail/product_detail_arguments.dart';
import 'package:flutter/material.dart';

import '../routes/route_names.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllCategories();
    getAllProducts();
    getCarousals();
  }
  HomeServices homeServices = HomeServices();

  bool isLoading = false;

  List<ProductElement>? products;

  num offerPrice = 0;
  num actualPrice = 0;

  List<HomeCategoryModel> categoryList = [];

  List<Carrousals>? carousalList;

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
  }

  void getCarousals() async {
    isLoading = true;
    notifyListeners();
    await homeServices.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void calculatePrice(ProductElement product) {
    if (products != null) {
      offerPrice = product.price! * product.offer! / 100;
      actualPrice = product.price! - offerPrice;
    }
  }

  void gotoProductDetails(BuildContext context, String productId) {
    ProductDetailArguments args = ProductDetailArguments(productId: productId);
    Navigator.of(context).pushNamed(
      RouteNames.productDetail,
      arguments: args,
    );
  }
}
