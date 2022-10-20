import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  int selectedChipIndex = 0;
  int selectedColorIndex = 0;
  double realPrice = 0;

  void setChip(int newValue) {
    selectedChipIndex = newValue;
    notifyListeners();
  }

  void setColor(int newValue) {
    selectedColorIndex = newValue;
    notifyListeners();
  }

  void setProductInitialValues(Product product) {
    realPrice = product.price;
    notifyListeners();
  }

  void setQuantity(Product product) {
    product.quantity = 1;
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    product.price = product.price + realPrice;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity == 1) {
      return;
    }
    product.price = product.price - realPrice;
    product.quantity--;
    notifyListeners();
  }
}
