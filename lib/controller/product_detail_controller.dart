import 'dart:developer';

import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_detail_services.dart';
import 'package:flutter/material.dart';

import '../routes/route_names.dart';

class ProductDetailController extends ChangeNotifier {
  ProductDetailServices productDetailServices = ProductDetailServices();
  int selectedChipIndex = 0;
  int selectedColorIndex = 0;

  int selectedImageListIndex = 0;

  double realPrice = 0;

  ProductElement? productElement;

  bool isLoading = false;

  void getOneProduct(
      {required BuildContext context, required String productId}) async {
    isLoading = true;
    notifyListeners();
    productDetailServices.getOneProduct(productId).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
        log('product not null');
        productElement = value;
        //ProductDetailArguments args = ProductDetailArguments(index: index);
        Navigator.of(context).pushNamed(
          RouteNames.productDetail,
          //arguments: args,
        );
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void setChip(int newValue) {
    selectedChipIndex = newValue;
    notifyListeners();
  }

  void setColor(int newValue) {
    selectedColorIndex = newValue;
    notifyListeners();
  }

  void setCarouselImage(int index) {
    log(index.toString());
    selectedImageListIndex = index;
    notifyListeners();
  }

  // void setProductInitialValues(Product product) {
  //   realPrice = product.price;
  //   notifyListeners();
  // }

  // void setQuantity(Product product) {
  //   product.quantity = 1;
  //   notifyListeners();
  // }

  // void increaseQuantity(Product product) {
  //   product.quantity++;
  //   product.price = product.price + realPrice;
  //   notifyListeners();
  // }

  // void decreaseQuantity(Product product) {
  //   if (product.quantity == 1) {
  //     return;
  //   }
  //   product.price = product.price - realPrice;
  //   product.quantity--;
  //   notifyListeners();
  // }
}
