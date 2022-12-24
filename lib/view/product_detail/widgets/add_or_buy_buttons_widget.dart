import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/app_spacing.dart';
import '../../../routes/route_names.dart';
import '../../../widgets/custom_button.dart';

class AddToCartorBuyButtonsWidget extends StatelessWidget {
  const AddToCartorBuyButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cartController = Provider.of<CartController>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: Consumer<ProductDetailController>(
            builder: (BuildContext context, value, Widget? child) {
              return CustomButtonWidget(
                text: "Add to cart",
                onTap: () {
                  // cartController.addProductToCart(
                  //   context: context,
                  //   productId: value.productElement!.id!,
                  //   selectedColor: value.productElement!
                  //       .colors![value.selectedColorIndex].color!,
                  //   selectedSize:
                  //       value.productElement!.size![value.selectedSizeIndex],
                  // );
                },
              );
            },
          ),
        ),
        AppSpacing.kWidth5,
        Expanded(
          child: CustomButtonWidget(
            text: "Buy Now",
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.stepperScreen);
            },
          ),
        )
      ],
    );
  }
}
