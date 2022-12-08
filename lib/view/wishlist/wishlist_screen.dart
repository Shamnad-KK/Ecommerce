import 'package:ecommerce/model/wishlist_model.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/wishlist_controller.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_padding.dart';
import '../../helpers/app_spacing.dart';
import '../../helpers/apptext_style.dart';
import '../home/widgets/product_status_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistController =
        Provider.of<WishlistController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wishlistController.getAllWishlist();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Consumer<WishlistController>(
              builder: (BuildContext context, value, Widget? child) {
            final list = value.wishlist;
            return list.isEmpty
                ? const CustomNotFoundWidget(
                    title: 'Wishlist is empty',
                    subtitle: 'You haven\'t added any products to wishlist')
                : SingleChildScrollView(
                    child: GridView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.60,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) {
                          final WishlistProductElement product = list[index];

                          value.calculatePrice(product);

                          return GestureDetector(
                            onTap: () {
                              value.gotoProductDetails(context, product.id);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height * 0.25,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        product.colors[0].images[0],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: AppPadding.allside5,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: AddorRemoveFavoriteWidget(
                                        productId: product.id,
                                      ),
                                    ),
                                  ),
                                ),
                                AppSpacing.kHeight5,
                                Text(
                                  product.name,
                                  style: AppTextStyle.body2,
                                ),
                                SizedBox(
                                  width: size.width * 0.36,
                                  child: const ProductStatusWidget(),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹ ${product.price.round()}",
                                      style: AppTextStyle.body2.copyWith(
                                          color:
                                              AppColors.indicatorInactiveColor,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    AppSpacing.kWidth30,
                                    Text(
                                      "${product.offer.round()}% OFF",
                                      style: AppTextStyle.bodySmall
                                          .copyWith(color: Colors.green),
                                    ),
                                    AppSpacing.kWidth5,
                                    Text(
                                      "₹${value.actualPrice.round()}",
                                      style: AppTextStyle.body2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  );
          }),
        ),
      ),
    );
  }
}
