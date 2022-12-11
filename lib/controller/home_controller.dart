import 'dart:developer';

import 'package:ecommerce/model/carousal_model.dart';
import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:ecommerce/view/all_products/products_filter_screen_arguments.dart';
import 'package:ecommerce/view/product_detail/product_detail_arguments.dart';
import 'package:flutter/material.dart';

import '../routes/route_names.dart';

class HomeController extends ChangeNotifier {
  HomeController(this.homeServices) {
    callInit();
  }
  HomeServices homeServices;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // bool get showLoading =>
  //     carousalList.isEmpty ||
  //     categoryList.isEmpty ||
  //     products.isEmpty ||
  //     _isLoading == true;

  List<ProductElement> products = [];

  num offerPrice = 0;
  num actualPrice = 0;

  List<HomeCategoryModel> categoryList = [];

  List<Carrousals> carousalList = [];

  void callInit() async {
    log('poooy');
    await getCarousals();

    log('hy');
    await getAllCategories();
    log('kuuyy');
    await getAllProducts();
    log('hey');
  }

  Future<void> getCarousals() async {
    _isLoading = true;
    notifyListeners();
    final future = homeServices.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
      }
    });
    await future;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllCategories() async {
    _isLoading = true;
    notifyListeners();
    final future = homeServices.getAllCategories().then((value) {
      if (value.isNotEmpty) {
        categoryList = value;
      }
    });
    await future;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    _isLoading = true;
    notifyListeners();
    final future = homeServices.getAllProducts().then((value) {
      if (value != null) {
        products = value;
      }
    });
    await future;
    _isLoading = false;
    notifyListeners();
  }

  void calculatePrice(ProductElement? product) {
    if (product != null) {
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

  void gotoProductFilter(
      BuildContext context, String categoryId, String title) {
    ProductsFilerScreenArguments args =
        ProductsFilerScreenArguments(categoryId: categoryId, title: title);
    Navigator.of(context).pushNamed(
      RouteNames.productsFilter,
      arguments: args,
    );
  }
}
