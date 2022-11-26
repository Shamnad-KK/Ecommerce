import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';
import '../../../helpers/apptext_style.dart';
import '../../../widgets/add_or_remove_favorite_widget.dart';

class ProductNameRowWidget extends StatelessWidget {
  const ProductNameRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailController>().productElement;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product?.name ?? "No name",
          style: AppTextStyle.titleLarge,
        ),
        AddorRemoveFavoriteWidget(
          productId: product!.id!,
        ),
      ],
    );
  }
}
