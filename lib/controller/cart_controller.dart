import 'dart:developer';

import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/widgets/custom_delete_from_cart_widget.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  double realPrice = 0;
  double totalPrice = 0.0;
  List<Product> cartList = [];

  void setProductInitialValues(Product product) {
    realPrice = product.price;
    notifyListeners();
  }

  void addProductToCart(
      Product product, int selectedChipIndex, int selectedColorIndex) {
    Product cartProduct = Product(
      name: product.name,
      price: product.price,
      image: product.image,
      description: product.description,
      rating: product.rating,
      reviews: product.reviews,
      isFavorite: product.isFavorite,
      selectedSize: product.sizes![selectedChipIndex],
      quantity: product.quantity,
      selectedColor: product.colors![selectedColorIndex],
    );
    // cartController.addProductToCart(cartProduct);
    cartList.add(cartProduct);
    totalPrice = product.price;
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
