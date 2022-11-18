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
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: Consumer<ProductDetailController>(
                builder: (BuildContext context, value, Widget? child) {
                  final product = value.productElement;
                  return FittedBox(
                    child: Text(
                      "\$ ${product!.price}",
                      style: AppTextStyle.titleLarge,
                    ),
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
