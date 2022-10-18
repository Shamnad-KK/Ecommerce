import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductStatusWidget extends StatelessWidget {
  const ProductStatusWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.star,
          color: AppColors.whiteColor,
        ),
        Text(
          product.rating,
          style: AppTextStyle.bodySmall,
        ),
        const Text(
          "|",
          style: AppTextStyle.bodySmall,
        ),
        Row(
          children: [
            Container(
              padding: AppPadding.allside5,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Text(
                product.reviews,
                style: AppTextStyle.labelSmall,
              ),
            ),
            const Text(
              "sold",
              style: AppTextStyle.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
