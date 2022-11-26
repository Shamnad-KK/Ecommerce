import 'dart:developer';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/wishlist_controller.dart';

class AddorRemoveFavoriteWidget extends StatelessWidget {
  const AddorRemoveFavoriteWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    log('add or remove called');
    return Container(
      padding: AppPadding.allside2,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<WishlistController>(
        builder: (BuildContext context, value, Widget? child) {
          List<String> idList = [];
          idList = value.wishlist.map((e) {
            return e.id;
          }).toList();

          bool contains = idList.contains(productId);
          return InkWell(
            onTap: () {
              !contains
                  ? value.addToWishlist(productId)
                  : value.removeFromWishlist(productId);
            },
            child: Icon(
              CupertinoIcons.heart_fill,
              color: value.wishlist.isEmpty
                  ? AppColors.whiteColor
                  : contains
                      ? Colors.red
                      : AppColors.whiteColor,
            ),
          );
        },
      ),
    );
  }
}
