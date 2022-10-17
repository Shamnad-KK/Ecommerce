import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class HomeRowWidget extends StatelessWidget {
  const HomeRowWidget({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);
  final String leading;
  final String trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: AppTextStyle.titleMedium,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            trailing,
            style: AppTextStyle.titleMedium,
          ),
        ),
      ],
    );
  }
}
