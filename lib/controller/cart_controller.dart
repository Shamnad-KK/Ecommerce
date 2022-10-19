import 'dart:developer';

import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/widgets/custom_delete_from_cart_widget.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    calculateTotalPrice();
  }
  double totalPrice = 0.0;
  List<Product> cartList = [];

  void addProductToCart(Product product) {
    totalPrice = product.price;
    cartList.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDeleteAlertWidget(
          onTap: () {
            cartList.remove(product);
            notifyListeners();
          },
        );
      },
    );
  }

  void calculateTotalPrice() {
    double sum = 0.0;
    for (var i = 0; i < cartList.length; i++) {
      sum = sum + cartList[i].price;
      log(sum.toString());
    }
    totalPrice = sum;
    notifyListeners();
  }
}
