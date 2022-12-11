import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helpers/app_padding.dart';

class HomeShimmers {
  static Widget carouserShimmer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Container(
          margin: AppPadding.mainPading,
          width: size.width,
          height: size.height * 0.24,
          color: AppColors.whiteColor,
        ));
  }

  static Widget categoryShimmer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 80,
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: size.width * 0.07),
                index < 3
                    ? SizedBox(
                        width: size.width * 0.1,
                      )
                    : const SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget homeRowShimmers(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Padding(
        padding: AppPadding.mainPading,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.44,
              height: size.height * 0.025,
              color: AppColors.whiteColor,
            ),
            Container(
              width: size.width * 0.25,
              height: size.height * 0.025,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }

  static Widget homeProductCardShimmer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Padding(
        padding: AppPadding.mainPading,
        child: Container(
          height: size.height * 0.2,
          width: size.width,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
