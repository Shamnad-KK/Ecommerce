import 'dart:developer';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/services/wishlist_service.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:ecommerce/view/product_detail/product_detail_arguments.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../model/wishlist_model.dart';
import '../routes/route_names.dart';

class WishlistController extends ChangeNotifier {
  WishlistController() {
    initialCalls();
  }

  Future<void> initialCalls() async {
    await getAllWishlist();
  }

  bool isLoading = false;

  List<WishlistProductElement> wishlist = [];

  void addOrRemoveWishlist(String productId) async {
    isLoading = true;
    notifyListeners();
    await WishListService().addOrRemoveWishlist(productId).then((value) {
      if (value != null) {
        if (value == 201) {
          AppPopUps.showToast(
              'Product added to wishlist', AppColors.successColor);
        } else {
          AppPopUps.showToast(
              'Product removed from wishlist', AppColors.successColor);
        }
      }
    });
    await getAllWishlist();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllWishlist() async {
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

  // void removeFromWishlist(String productId) async {
  //   await WishListService().removeFromWishlist(productId).then((value) {
  //     if (value == true) {
  //       log('removed successfully');
  //     }
  //   });
  //   getAllWishlist();
  // }

  void gotoProductDetails(BuildContext context, String productId) {
    final args = ProductDetailArguments(productId: productId);
    Navigator.of(context).pushNamed(
      RouteNames.productDetail,
      arguments: args,
    );
  }
}
