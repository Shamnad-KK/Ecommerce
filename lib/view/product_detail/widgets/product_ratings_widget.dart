import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailController>().productElement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ratings',
          style: AppTextStyle.body1,
        ),
        AppSpacing.kHeight5,
        Text(
          product?.rating ?? "No ratings",
          style: AppTextStyle.subtitle2,
        ),
        AppSpacing.kHeight20,
      ],
    );
  }
}
