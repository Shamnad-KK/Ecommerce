import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class CustomNotFoundWidget extends StatelessWidget {
  const CustomNotFoundWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * 0.3,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: size.width * 0.5,
                child: Image.asset(
                  "assets/common/no_data.png",
                  fit: BoxFit.fill,
                )),
            AppSpacing.kHeight10,
            Text(
              title,
              style: AppTextStyle.body1,
              textAlign: TextAlign.center,
            ),
            AppSpacing.kHeight10,
            Text(
              subtitle,
              style: AppTextStyle.subtitle2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
