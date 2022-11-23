import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';
import '../../../helpers/app_spacing.dart';
import '../../../helpers/apptext_style.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: AppTextStyle.body1,
        ),
        AppSpacing.kHeight5,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Consumer<ProductDetailController>(
                builder: (BuildContext context, productDetailConsumer,
                    Widget? child) {
                  final product = productDetailConsumer.productElement;

                  return Row(
                    children: [
                      Text(
                        "₹${productDetailConsumer.totalPrice.round()}",
                        style: AppTextStyle.headLine6.copyWith(
                            color: AppColors.indicatorInactiveColor,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400),
                      ),
                      AppSpacing.kWidth10,
                      Text(
                        "₹${productDetailConsumer.actualPrice.round()}",
                        style: AppTextStyle.titleLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSpacing.kWidth10,
                      Text(
                        "${product!.offer}%Off",
                        style: AppTextStyle.headLine6
                            .copyWith(color: Colors.green),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        AppSpacing.kHeight10,
      ],
    );
  }
}
