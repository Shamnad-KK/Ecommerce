import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeItemCardWidget extends StatelessWidget {
  const HomeItemCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/home/download (1).jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: AppPadding.allside5,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
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
                          color: value.favoriteBoolList[index]
                              ? AppColors.redColor
                              : AppColors.whiteColor,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const Text(
              "Casual shirt",
              style: AppTextStyle.body2,
            ),
            SizedBox(
              width: size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.whiteColor,
                  ),
                  const Text(
                    "4.3",
                    style: AppTextStyle.bodySmall,
                  ),
                  const Text(
                    "|",
                    style: AppTextStyle.bodySmall,
                  ),
                  Container(
                    padding: AppPadding.allside5,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: const Text(
                      "4352 sold",
                      style: AppTextStyle.labelSmall,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
