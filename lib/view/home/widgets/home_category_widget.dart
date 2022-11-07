import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenCategoryWidget extends StatelessWidget {
  const HomeScreenCategoryWidget({
    Key? key,
    required this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: size.width * 0.07,
            backgroundColor: AppColors.mainColor,
            child: CachedNetworkImage(
              imageUrl: image,
              color: AppColors.homeCategoryIcons,
              height: size.height * 0.1,
              width: size.width * 0.1,
              //placeholder: (context, url) => const CustomLoadingWidget(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          AppSpacing.kHeight5,
          Text(
            title,
            style: AppTextStyle.body2,
          )
        ],
      ),
    );
  }
}
