import 'package:flutter/material.dart';

import '../../../helpers/app_spacing.dart';
import '../../../routes/route_names.dart';
import '../../../widgets/custom_button.dart';

class AddorBuyButtonsWidget extends StatelessWidget {
  const AddorBuyButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonWidget(
            text: "Add to cart",
            onTap: () {
              // cartController.addProductToCart(
              //     product,
              //     productDetailController.selectedChipIndex,
              //     productDetailController
              //         .selectedColorIndex);
              // product.price =
              //     productDetailController.realPrice;
              // Navigator.of(context).pop();
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
