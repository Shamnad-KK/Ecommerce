import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/view/steppers/widgets/price_details_row_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_outlined_button.dart';

class OrderSummaryStepperWidget extends StatelessWidget {
  const OrderSummaryStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Deliver to:"),
            CustomOutlinedButton(
              text: "Change",
              onTap: () {},
            ),
          ],
        ),
        AppSpacing.kHeight10,
        Container(
          color: AppColors.mainColor,
          padding: AppPadding.allside5,
          child: const Text("Shamnad KK"),
        ),
        const CustomDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.28,
              color: AppColors.whiteColor,
            ),
            AppSpacing.kWidth10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Formal Shirt",
                  style: AppTextStyle.titleMedium,
                ),
                AppSpacing.kHeight5,
                const Text(
                  "Size: 36",
                  style: AppTextStyle.subtitle2,
                ),
                AppSpacing.kHeight5,
                Row(
                  children: [
                    Text(
                      "1499",
                      style: AppTextStyle.subtitle2.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    AppSpacing.kWidth5,
                    const Text("849", style: AppTextStyle.body2),
                    AppSpacing.kWidth5,
                    const Text("15% off", style: AppTextStyle.subtitle2),
                  ],
                ),
              ],
            )
          ],
        ),
        const CustomDivider(),
        Row(
          children: [
            const Text(
              "Delivery expected by ",
              style: AppTextStyle.body2,
            ),
            Text(
              "Tue Nov 15",
              style: AppTextStyle.body2.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CustomDivider(),
        Text(
          "Price Details",
          style: AppTextStyle.body1.copyWith(fontWeight: FontWeight.bold),
        ),
        AppSpacing.kHeight20,
        const OrderSummaryPriceDetails(
          leading: 'Price(1)',
          trailing: '849',
        ),
        const OrderSummaryPriceDetails(
          leading: 'Discount',
          trailing: '-651',
        ),
        const OrderSummaryPriceDetails(
          leading: 'Delivery Charges',
          trailing: 'Free',
        ),
        const CustomDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Total Amount",
              style: AppTextStyle.headLine6,
            ),
            Text(
              "849",
              style: AppTextStyle.headLine6,
            ),
          ],
        ),
        const CustomDivider(),
      ],
    );
  }
}
