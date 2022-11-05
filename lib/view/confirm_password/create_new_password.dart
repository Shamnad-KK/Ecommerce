import 'package:ecommerce/controller/confirm_password_controller.dart';
import 'package:ecommerce/controller/forgot_password_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/confirm_passwordmodel.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final createNewPasswordController =
        Provider.of<CreateNewPasswordController>(context, listen: false);
    final forgotPasswordController =
        Provider.of<ForgotPasswordController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Password"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.mainPading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.35,
                  width: size.width,
                  child: Image.asset(
                      "assets/confirm_password/confirm_password.png"),
                ),
                AppSpacing.kHeight30,
                Text(
                  "Create your new password",
                  style: AppTextStyle.headLine6
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                AppSpacing.kHeight30,
                CustomTextField(
                  controller: createNewPasswordController.passwordController,
                  hint: "Password",
                  obscureText:
                      context.read<CreateNewPasswordController>().isObscure,
                  isDense: true,
                  validator: (p0) =>
                      createNewPasswordController.passwordValidation(p0),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.whiteColor,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      context
                          .read<CreateNewPasswordController>()
                          .setObscureTextVisibility();
                    },
                    child: Icon(
                      context.watch<CreateNewPasswordController>().isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.suffixIconColor,
                      size: 18,
                    ),
                  ),
                ),
                AppSpacing.kHeight30,
                Consumer<CreateNewPasswordController>(
                  builder: (BuildContext context, value, Widget? child) {
                    return value.isLoading
                        ? const CustomLoadingWidget()
                        : CustomButtonWidget(
                            text: "Continue",
                            onTap: () {
                              CreateNewPasswordModel model =
                                  CreateNewPasswordModel(
                                email: forgotPasswordController
                                    .emailController.text,
                                password: createNewPasswordController
                                    .passwordController.text,
                              );
                              createNewPasswordController.confirmNewPassword(
                                model,
                                context,
                              );
                            },
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
