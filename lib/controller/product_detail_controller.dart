import 'dart:developer';

import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_detail_services.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  ProductDetailController() {
    setLoading(true);
  }
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

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getOneProduct(BuildContext context, String productId) async {
    isLoading = true;
    notifyListeners();
    await productDetailServices.getOneProduct(productId).then((value) {
      if (value != null) {
        log('product not null');
        productElement = value;
        isLoading = false;
        notifyListeners();
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
    isLoading = true;
    notifyListeners();
    initialActualPrice = actualPrice;
    initialTotalPrice = product.price!;
    totalPrice = product.price!;
    log("initial actual price: $initialActualPrice");
    isLoading = false;
    notifyListeners();
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
