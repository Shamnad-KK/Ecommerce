import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/profile/widgets/profile_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Shamnad KK",
                  style: AppTextStyle.titleMedium,
                ),
                AppSpacing.kHeight5,
                const Text(
                  "+91 987654321",
                  style: AppTextStyle.subtitle2,
                ),
                AppSpacing.kHeight40,
                ProfileRowWidget(
                  icon: Icons.person_outline,
                  text: "Edit Profile",
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.editProfileScreen);
                  },
                ),
                ProfileRowWidget(
                  icon: Icons.location_on_outlined,
                  text: "Address",
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.addressScreen);
                  },
                ),
                ProfileRowWidget(
                  icon: Icons.notifications_outlined,
                  text: "Notification",
                  onTap: () {},
                ),
                ProfileRowWidget(
                  icon: Icons.privacy_tip_outlined,
                  text: "Privacy Policy",
                  onTap: () {},
                ),
                ProfileRowWidget(
                  icon: Icons.help_center_outlined,
                  text: "Help Center",
                  onTap: () {},
                ),
                ProfileRowWidget(
                  icon: CupertinoIcons.person_2,
                  text: "Invite Friends",
                  onTap: () {},
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: AppColors.redColor,
                    ),
                    AppSpacing.kWidth10,
                    Text(
                      "Log out",
                      style: AppTextStyle.body1
                          .copyWith(color: AppColors.redColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
