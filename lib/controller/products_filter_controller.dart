import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_filter_service.dart';
import 'package:flutter/material.dart';

import '../routes/route_names.dart';
import '../view/product_detail/product_detail_arguments.dart';

class ProductFilterController extends ChangeNotifier {
  ProductFilterService productFilterService = ProductFilterService();
  bool isLoading = false;
  List<ProductElement> productsListByCategory = [];
  num offerPrice = 0;
  num actualPrice = 0;

  void getProductByCategory(String categoryId) async {
    isLoading = true;
    notifyListeners();
    await productFilterService.getProductsByCategory(categoryId).then((value) {
      if (value != null) {
        productsListByCategory = value;
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void calculatePrice(ProductElement product) {
    if (productsListByCategory.isNotEmpty) {
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
