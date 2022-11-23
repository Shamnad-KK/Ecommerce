import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';
import '../../../helpers/app_spacing.dart';
import '../../../helpers/apptext_style.dart';

class ProductionDescriptionWidget extends StatelessWidget {
  const ProductionDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailController>().productElement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: AppTextStyle.body1,
        ),
        AppSpacing.kHeight5,
        Text(
          product?.description ?? "No description",
          style: AppTextStyle.subtitle2,
        ),
        AppSpacing.kHeight20,
      ],
    );
  }
}
