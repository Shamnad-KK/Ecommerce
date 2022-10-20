import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: AppPadding.sidePading15,
      child: AppBar(
        toolbarHeight: size.height * 0.16,
        backgroundColor: AppColors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Good Morning 👋",
                  style: AppTextStyle.subtitle2,
                ),
                AppSpacing.kHeight5,
                Text(
                  "Shamnad",
                  style: AppTextStyle.body1,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.wishlistScreen);
              },
              child: const Icon(
                CupertinoIcons.heart,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.0),
          child: const CustomTextField(
            hint: "Search",
            isSearchField: true,
            isDense: true,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: AppColors.prefixIconColor,
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: AppColors.suffixIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
