import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  List<Product> cartList = [];

  void addProductToCart(Product product) {
    cartList.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    cartList.remove(product);
    notifyListeners();
  }
}
