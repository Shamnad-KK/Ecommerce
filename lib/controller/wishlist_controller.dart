import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class WishlistController extends ChangeNotifier {
  List<Product> wishList = [];

  addItemToWishList(Product product) {
    wishList.add(product);
    notifyListeners();
  }

  removeItemFromWishList(Product product) {
    wishList.remove(product);
    notifyListeners();
  }
}
