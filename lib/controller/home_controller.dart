import 'dart:developer';

import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<Product> productList = [
    Product(
      name: "Casual Shirt",
      price: 400,
      image: "assets/home/download (1).jpg",
      description: "This is a good product",
      rating: "4.3",
      reviews: "1234",
      isFavorite: false,
      sizes: [30, 34, 36],
    ),
    Product(
      name: "Formal Shirt",
      price: 500,
      image: "assets/onboarding/f.png",
      description: "This is a good product",
      rating: "4.5",
      reviews: "4321",
      isFavorite: false,
      sizes: [34, 35, 38],
    ),
  ];

  void setFavorite(int index) {
    productList[index].isFavorite = !productList[index].isFavorite;
    notifyListeners();
    log(productList[index].isFavorite.toString());
  }
}
