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

  int selectedImageListIndex = 0;

  ProductElement? productElement;

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

  void setSizeIndex(int newValue) {
    selectedSizeIndex = newValue;
    notifyListeners();
  }

  void setCarouselImage(int index) {
    log(index.toString());
    selectedImageListIndex = index;
    notifyListeners();
  }
}
