import 'package:ecommerce/controller/edit_profile_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileController =
        Provider.of<EditProfileController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: editProfileController.nameController,
                  hint: "Full name",
                  isDense: true,
                  keyboardType: TextInputType.name,
                ),
                AppSpacing.kHeight10,
                CustomTextField(
                  controller: editProfileController.emailController,
                  hint: "Email",
                  isDense: true,
                ),
                AppSpacing.kHeight10,
                // CustomTextField(
                //   controller: editProfileController.dateController,
                //   hint: "Date of birth",
                //   isDense: true,
                //   readOnly: true,
                //   suffixIcon: IconButton(
                //     onPressed: () {
                //       editProfileController.pickDate(context);
                //     },
                //     icon: const Icon(
                //       Icons.calendar_today,
                //       color: AppColors.suffixIconColor,
                //     ),
                //   ),
                // ),
                // AppSpacing.kHeight10,
                CustomTextField(
                  controller: editProfileController.phoneController,
                  hint: "Phone number",
                  isDense: true,
                  keyboardType: TextInputType.number,
                ),
                AppSpacing.kHeight10,
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    decoration: const InputDecoration(
                      contentPadding: AppPadding.sidePading12,
                      hintText: "Gender",
                      fillColor: AppColors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                    ),
                    value: editProfileController.dropDownValue,
                    items: ["Male", "Female"]
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      editProfileController.setDropDownValue(value!);
                    },
                  ),
                ),
                AppSpacing.kHeight30,
                CustomButtonWidget(
                  text: "Continue",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
