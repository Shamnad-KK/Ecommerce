import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/cupertino.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Ratings',
          style: AppTextStyle.body1,
        ),
        AppSpacing.kHeight5,
        Text(
          "No Ratings",
          style: AppTextStyle.subtitle2,
        ),
        AppSpacing.kHeight20,
      ],
    );
  }
}
