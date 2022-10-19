import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  void setProduct() {}
  void setQuantity(Product product) {
    product.quantity = 1;
    notifyListeners();
  }

  void increaseQuantity(Product product, double price) {
    product.quantity++;
    product.price = product.price + price;
    notifyListeners();
  }

  void decreaseQuantity(Product product, double price) {
    if (product.quantity == 1) {
      return;
    }
    product.price = product.price - price;
    product.quantity--;
    notifyListeners();
  }
}
