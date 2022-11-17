import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddorRemoveFavoriteWidget extends StatelessWidget {
  const AddorRemoveFavoriteWidget({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final int index;
  final ProductElement product;

  @override
  Widget build(BuildContext context) {
    final wishlistController =
        Provider.of<WishlistController>(context, listen: false);
    return Container(
      padding: AppPadding.allside2,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return InkWell(
            onTap: () {
              value.setFavorite(index);
              if (value.productList[index].isFavorite == true) {
                //wishlistController.addItemToWishList(product);
              } else {
                //wishlistController.removeItemFromWishList(product);
              }
            },
            child: Icon(
              CupertinoIcons.heart_fill,
              color: AppColors.whiteColor,
            ),
          );
        },
      ),
    );
  }
}
