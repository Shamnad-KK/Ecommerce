import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';
import '../../../helpers/app_spacing.dart';
import '../../../helpers/apptext_style.dart';
import '../../../widgets/product_quantity_customizer_widget.dart';

class ProductQuantityWidget extends StatelessWidget {
  const ProductQuantityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailController>().productElement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Quantity",
              style: AppTextStyle.body1,
            ),
            AppSpacing.kWidth10,
            ProductQuantityCustomizerWidget(product: product!),
          ],
        ),
        AppSpacing.kHeight20,
      ],
    );
  }
}
