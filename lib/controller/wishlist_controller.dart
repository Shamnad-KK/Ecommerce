import 'dart:developer';

import 'package:ecommerce/services/wishlist_service.dart';
import 'package:flutter/material.dart';

import '../model/wishlist_model.dart';
import '../routes/route_names.dart';

class WishlistController extends ChangeNotifier {
  WishlistController() {
    getAllWishlist();
  }

  num offerPrice = 0;
  num actualPrice = 0;

  bool isLoading = false;

  void calculatePrice(WishlistProductElement product) {
    if (wishlist.isNotEmpty) {
      offerPrice = product.price * product.offer / 100;
      actualPrice = product.price - offerPrice;
    }
  }

  List<WishlistProductElement> wishlist = [];

  void addToWishlist(String productId) async {
    isLoading = true;
    notifyListeners();
    await WishListService().addToWishlist(productId).then((value) {
      if (value == true) {
        log('added to wishlist');
      }
    });
    getAllWishlist();
  }

  void getAllWishlist() async {
    isLoading = true;
    notifyListeners();
    await WishListService().getAllWishlist().then((value) {
      if (value != null) {
        wishlist = value;
        log('wishlist fetched successfully');
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void removeFromWishlist(String productId) async {
    await WishListService().removeFromWishlist(productId).then((value) {
      if (value == true) {
        log('removed successfully');
      }
    });
    getAllWishlist();
  }

  void gotoProductDetails(BuildContext context, String productId) {
    Navigator.of(context).pushNamed(
      RouteNames.productDetail,
      arguments: {'productId': productId},
    );
  }
}
