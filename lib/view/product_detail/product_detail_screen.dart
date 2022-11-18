import 'dart:developer';

import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/view/product_detail/widgets/product_quantity_widget.dart';
import 'package:ecommerce/view/product_detail/widgets/product_variant_widget.dart';
import 'package:ecommerce/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/add_or_buy_buttons_widget.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_detail_carousel.dart';
import 'widgets/product_name_row.dart';
import 'widgets/product_price_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final cartController = Provider.of<CartController>(context, listen: false);
    final productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);

    //product.quantity = 1;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        productDetailController.setChip(0);
        productDetailController.setColor(0);
        //productDetailController.setProductInitialValues(product);
      },
    );
    // log(product.id!);
    //productDetailController.getOneProduct(product.id!);

    log('product detail build called');

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
              const ProductDetailCarouselWidget(),
              Padding(
                padding: AppPadding.mainPading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductNameRowWidget(),
                    CustomDivider(color: AppColors.divider),
                    ProductionDescriptionWidget(),
                    ProductVariantWidget(),
                    ProductQuantityWidget(),
                    ProductPriceWidget(),
                    AddorBuyButtonsWidget()
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
