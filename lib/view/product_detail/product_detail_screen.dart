import 'dart:developer';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/product_quantity_customizer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.index,
  });
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double price = product.price;
    final cartController = Provider.of<CartController>(context, listen: false);

    product.quantity = 1;
    log("hy");
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.mainPading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.titleLarge,
                        ),
                        AddorRemoveFavoriteWidget(index: index),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: ProductStatusWidget(product: product),
                    ),
                    AppSpacing.kHeight10,
                    const Divider(
                      color: AppColors.divider,
                    ),
                    AppSpacing.kHeight10,
                    const Text(
                      "Descriptioin",
                      style: AppTextStyle.body1,
                    ),
                    AppSpacing.kHeight5,
                    Text(
                      product.description,
                      style: AppTextStyle.subtitle2,
                    ),
                    AppSpacing.kHeight20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Size", style: AppTextStyle.body1),
                        Row(
                          children: [
                            const Text(
                              "Quantity",
                              style: AppTextStyle.body1,
                            ),
                            AppSpacing.kWidth10,
                            ProductQuantityCustomizerWidget(product: product),
                          ],
                        ),
                        AppSpacing.kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              child: Consumer<HomeController>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Text(
                                    "\$ ${value.productList[index].price}",
                                    style: AppTextStyle.titleMedium,
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomButtonWidget(
                                text: "Add to cart",
                                onTap: () {
                                  Product cartProduct = Product(
                                    name: product.name,
                                    price: product.price,
                                    image: product.image,
                                    description: product.description,
                                    rating: product.rating,
                                    reviews: product.reviews,
                                    isFavorite: product.isFavorite,
                                    sizes: product.sizes,
                                    quantity: product.quantity,
                                  );
                                  cartController.addProductToCart(cartProduct);
                                  product.price = price;
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
