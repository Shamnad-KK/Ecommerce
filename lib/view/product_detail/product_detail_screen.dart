import 'dart:developer';

import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
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
    final productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // productDetailController.setQuantity();
    });

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
                            for (int i = 0; i < product.sizes.length; i++)
                              Consumer<ProductDetailController>(builder:
                                  (BuildContext context, value, Widget? child) {
                                return ChoiceChip(
                                  side: const BorderSide(
                                    color: AppColors.whiteColor,
                                  ),
                                  onSelected: (valuee) {},
                                  selected: true,
                                  label: Text(
                                    "${product.sizes[i]}",
                                    style: AppTextStyle.bodySmall,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                );
                              })
                          ],
                        ),
                        AppSpacing.kHeight20,
                        Row(
                          children: [
                            const Text(
                              "Quantity",
                              style: AppTextStyle.body1,
                            ),
                            AppSpacing.kWidth10,
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      productDetailController
                                          .decreaseQuantity();
                                      product.price -= product.price;
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  Text(
                                      "${context.watch<ProductDetailController>().quantity}"),
                                  IconButton(
                                    onPressed: () {
                                      productDetailController
                                          .increaseQuantity();
                                      int price = product.price;
                                      product.price = product.price + price;
                                      price = price;
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.kHeight20,
                        Text("\$ ${product.price}")
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
