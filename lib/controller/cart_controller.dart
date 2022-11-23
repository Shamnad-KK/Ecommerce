import 'dart:developer';

import 'package:ecommerce/model/cart_add.dart';
import 'package:ecommerce/model/cart_products.dart';

import 'package:ecommerce/services/cart_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    getAllCartProducts();
  }

  CartProducts? cartProducts;
  List<CartProduct>? cartProduct;

  bool isLoading = false;

  num totalPrice = 0;
  int totalQuantity = 1;

  num offerPrice = 0;
  num actualPrice = 0;

  void addProductToCart(
      {required BuildContext context,
      required String productId,
      required String selectedColor,
      required dynamic selectedSize}) async {
    CartModel cartModel = CartModel(
      productId: productId,
      color: selectedColor,
      size: selectedSize,
    );

    await CartService().addToCart(cartModel).then((value) async {
      if (value == true) {
        getAllCartProducts();
        AppPopUps.showToast("Added to cart", Colors.green);
        Navigator.of(context).pop();
      }
    });
  }

  void getAllCartProducts() async {
    isLoading = true;
    notifyListeners();
    await CartService().getAllProducts().then((value) {
      if (value != null) {
        cartProducts = value;
        cartProduct = value.products;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  num initialActualPrice = 0;
  num initialTotalPrice = 0;

  void initializeProductPrices(CartProduct? product) {
    if (product != null) {
      initialActualPrice = actualPrice;
      initialTotalPrice = product.product.price;
      totalPrice = product.product.price;
      log("initial actual price: $initialActualPrice");
    }
  }

  void calculatePrice(int index) {
    final product = cartProduct?[index];
    if (product != null) {
      offerPrice = product.product.price * product.product.offer / 100;
      actualPrice = product.product.price - offerPrice;
      totalPrice = totalPrice + actualPrice;
      log('Actuallll : $actualPrice');
    }
  }

  // void incrementQuantity() {
  //   totalQuantity++;
  //   actualPrice += initialActualPrice;
  //   totalPrice += initialTotalPrice;
  //   log(actualPrice.toString());
  //   notifyListeners();
  // }

  // void decrementQuantity() {
  //   if (totalQuantity > 1) {
  //     totalQuantity--;
  //     actualPrice -= initialActualPrice;
  //     totalPrice -= initialTotalPrice;
  //     log(actualPrice.toString());
  //     notifyListeners();
  //   }
  // }
}
