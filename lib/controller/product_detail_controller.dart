import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  int quantity = 1;

  void setQuantity() {
    quantity = 1;
    notifyListeners();
  }

  void increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    quantity--;
    notifyListeners();
  }
}