import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_padding.dart';
import '../../helpers/app_spacing.dart';
import '../../helpers/apptext_style.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/product_quantity_customizer_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final cartController = Provider.of<CartController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // cartController.calculateTotalPrice();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<CartController>(
            builder: (BuildContext context, value, Widget? child) {
          if (value.isLoading) {
            return const CustomLoadingWidget();
          }
          if (value.cartProducts == null ||
              value.cartProducts!.products.isEmpty) {
            return const Center(
              child: CustomNotFoundWidget(
                title: "Your cart is empty",
                subtitle: "You haven't added any products",
              ),
            );
          } else {
            final productsList = value.cartProducts!.products;

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: productsList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final product = productsList[index].product;
                      value.calculatePrice(index);
                      value.initializeProductPrices(productsList[index]);
                      return Container(
                        margin: AppPadding.sidePading15,
                        padding: AppPadding.mainPading,
                        height: size.height * 0.17,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: AppColors.mediaButtonBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: size.height,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    image: DecorationImage(
                                        image: NetworkImage(value
                                            .cartProducts!
                                            .products[index]
                                            .product
                                            .colors[0]
                                            .images[0]),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                AppSpacing.kWidth20,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.name,
                                        style: AppTextStyle.body1),
                                    SizedBox(
                                      width: size.width * 0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: AppPadding.allside2,
                                            decoration: const BoxDecoration(
                                                color: AppColors.whiteColor,
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor: Color(int.parse(
                                                  product.colors[0].color)),
                                              radius: 10,
                                            ),
                                          ),
                                          const Text("|"),
                                          const Text(
                                            "Size =",
                                            style: AppTextStyle.labelSmall,
                                          ),
                                          Text(
                                            productsList[index].size,
                                            style: AppTextStyle.labelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹${value.actualPrice.round()}",
                                          style: AppTextStyle.body1,
                                        ),
                                        AppSpacing.kWidth10,
                                        Text(
                                          "₹${product.price}",
                                          style: AppTextStyle.body1.copyWith(
                                              color: AppColors
                                                  .indicatorInactiveColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // v.removeProductFromCart(
                                    //     product, context);
                                  },
                                  child: const Icon(Icons.delete_outline),
                                ),
                                AppSpacing.kWidth10,
                                const ProductQuantityCustomizerWidget()
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return AppSpacing.kHeight20;
                    },
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  padding: AppPadding.mainPading,
                  decoration: BoxDecoration(
                    color: AppColors.mediaButtonBg,
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Total Price",
                            style: AppTextStyle.subtitle2,
                          ),
                          Consumer<CartController>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return SizedBox(
                                width: size.width * 0.35,
                                child: Text(
                                  "₹${value.totalPrice}",
                                  style: AppTextStyle.body1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      AppSpacing.kWidth10,
                      Expanded(
                        child: CustomButtonWidget(
                          text: "Checkout",
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteNames.stepperScreen);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
