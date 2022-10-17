import 'package:ecommerce/helpers/app_padding.dart';
import 'package:flutter/material.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({
    Key? key,
    required this.index,
    required this.activeColor,
    required this.count,
    required this.inactiveColor,
  }) : super(key: key);
  final int index;
  final int count;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (sliderIndex) => Container(
          height: 5,
          margin: AppPadding.sidePading5,
          width: index == sliderIndex ? 25 : 5,
          decoration: BoxDecoration(
            color: index == sliderIndex ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
