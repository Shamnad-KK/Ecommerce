import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/view/onboarding/utils/onboard_components_list.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController =
        Provider.of<OnboardingController>(context, listen: false);
    onboardingController.pageController = PageController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: onboardingController.pageController,
          itemCount: onboardingList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    image: DecorationImage(
                      image: AssetImage(onboardingList[index].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(color: AppColors.bgColor),
                    child: Padding(
                      padding: AppPadding.sidePading15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            onboardingList[index].bodyText,
                            style: AppTextStyle.headline4,
                            textAlign: TextAlign.center,
                          ),
                          CustomIndicatorWidget(
                            count: 3,
                            index: index,
                            activeColor: AppColors.whiteColor,
                            inactiveColor: AppColors.indicatorInactiveColor,
                          ),
                          CustomButtonWidget(
                            text: onboardingList[index].buttonText,
                            onTap: () {
                              if (index < 2) {
                                onboardingController.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.slowMiddle,
                                );
                              } else {
                                onboardingController.toSignInScreen(context);
                              }
                            },
                          ),
                          if (index == 0 || index == 1)
                            CustomButtonWidget(
                              color: AppColors.mainColor,
                              textColor: AppColors.whiteColor,
                              text: "Skip",
                              onTap: () {
                                onboardingController.pageController
                                    .jumpToPage(2);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
