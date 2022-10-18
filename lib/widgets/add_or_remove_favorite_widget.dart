import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddorRemoveFavoriteWidget extends StatelessWidget {
  const AddorRemoveFavoriteWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allside2,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return InkWell(
            onTap: () {
              value.setFavorite(index);
            },
            child: Icon(
              CupertinoIcons.heart_fill,
              color: value.productList[index].isFavorite
                  ? AppColors.redColor
                  : AppColors.whiteColor,
            ),
          );
        },
      ),
    );
  }
}
