import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';

class CustomDeleteAlertWidget extends StatelessWidget {
  const CustomDeleteAlertWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Are you sure?",
        style: AppTextStyle.headLine6,
      ),
      content: const Text(
        "Do you want to delete ?",
        style: AppTextStyle.body1,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "No",
            style: AppTextStyle.body2,
          ),
        ),
        TextButton(
          onPressed: () {
            onTap();
            Navigator.of(context).pop();
          },
          child: const Text(
            "Yes",
            style: AppTextStyle.body2,
          ),
        ),
      ],
    );
  }
}
