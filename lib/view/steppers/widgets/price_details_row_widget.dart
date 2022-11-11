import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../../helpers/apptext_style.dart';

class OrderSummaryPriceDetails extends StatelessWidget {
  const OrderSummaryPriceDetails({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leading,
              style: AppTextStyle.body2,
            ),
            Text(
              trailing,
              style: AppTextStyle.body2,
            )
          ],
        ),
        AppSpacing.kHeight10,
      ],
    );
  }
}
