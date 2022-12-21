import 'dart:developer';

import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/view/product_detail/widgets/product_ratings_widget.dart';
import 'package:ecommerce/view/product_detail/widgets/product_variant_widget.dart';
import 'package:ecommerce/widgets/custom_divider.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/add_or_buy_buttons_widget.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_detail_carousel.dart';
import 'widgets/product_name_row.dart';
import 'widgets/product_price_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    // NavigationArguments arguments = NavigationArguments(context);
    // String productId = arguments.passedData['productId'];
    log(productId);
    final productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await productDetailController.getOneProduct(context, productId);
        productDetailController.calculatePrice();
        productDetailController
            .initializeProductPrices(productDetailController.productElement!);
        productDetailController.setSizeIndex(0);
        productDetailController.setColorIndex(0);
        productDetailController.setInitialQuantity(1);
      },
    );
    log('product detail build called');

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: Consumer<ProductDetailController>(
          builder: (context, value, child) => value.isLoading
              ? const CustomLoadingWidget()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProductDetailCarouselWidget(),
                            Padding(
                              padding: AppPadding.mainPading,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  ProductNameRowWidget(),
                                  CustomDivider(color: AppColors.divider),
                                  ProductionDescriptionWidget(),
                                  ProductRatingWidget(),
                                  ProductPriceWidget(),
                                  ProductSizeVariant(),
                                  ProductColorVariant(),
                                  //ProductQuantityWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const AddToCartorBuyButtonsWidget()
                  ],
                ),
        ),
      ),
    );
  }
}
