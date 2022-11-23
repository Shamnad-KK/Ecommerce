import 'dart:developer';

import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_detail_services.dart';
import 'package:flutter/material.dart';

import '../routes/route_names.dart';

class ProductDetailController extends ChangeNotifier {
  ProductDetailServices productDetailServices = ProductDetailServices();
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;

  int selectedImageListIndex = 0;

  ProductElement? productElement;

  num totalPrice = 0;
  int totalQuantity = 1;

  num offerPrice = 0;
  num actualPrice = 0;

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
        Navigator.of(context).pushNamed(RouteNames.productDetail);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void calculatePrice() {
    if (productElement != null) {
      offerPrice = productElement!.price! * productElement!.offer! / 100;
      actualPrice = productElement!.price! - offerPrice;
      log('Actuallll : $actualPrice');
    }
  }

  void setSizeIndex(int newValue) {
    selectedSizeIndex = newValue;
    notifyListeners();
  }

  void setColorIndex(int newValue) {
    selectedColorIndex = newValue;
    notifyListeners();
  }

  void setInitialQuantity(int newValue) {
    totalQuantity = newValue;
    notifyListeners();
  }

  void setCarouselImage(int index) {
    log(index.toString());
    selectedImageListIndex = index;
    notifyListeners();
  }

  num initialActualPrice = 0;
  num initialTotalPrice = 0;

  void initializeProductPrices(ProductElement product) {
    initialActualPrice = actualPrice;
    initialTotalPrice = product.price!;
    totalPrice = product.price!;
    log("initial actual price: $initialActualPrice");
  }

  void incrementQuantity(ProductElement product) {
    totalQuantity++;
    actualPrice += initialActualPrice;
    totalPrice += initialTotalPrice;
    log(actualPrice.toString());
    notifyListeners();
  }

  void decrementQuantity(ProductElement product) {
    if (totalQuantity > 1) {
      totalQuantity--;
      actualPrice -= initialActualPrice;
      totalPrice -= initialTotalPrice;
      log(actualPrice.toString());
      notifyListeners();
    }
  }
}
