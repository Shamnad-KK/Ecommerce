import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final addressController =
        Provider.of<AddressController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: const BoxDecoration(color: AppColors.mainColor),
              ),
              Padding(
                padding: AppPadding.mainPading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Address Details",
                        style: AppTextStyle.titleLarge,
                      ),
                    ),
                    AppSpacing.kHeight10,
                    CustomTextField(
                      controller: addressController.addressController,
                      hint: "Address",
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    AppSpacing.kHeight10,
                    CustomTextField(
                      controller: addressController.pinCodeController,
                      hint: "Pincode",
                      keyboardType: TextInputType.number,
                    ),
                    AppSpacing.kHeight10,
                    CustomTextField(
                      controller: addressController.landMarkController,
                      hint: "Landmark",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    AppSpacing.kHeight50,
                    CustomButtonWidget(
                      text: "Add",
                      onTap: () {
                        final address = Address(
                          address: addressController.addressController.text,
                          pincode: addressController.pinCodeController.text,
                          landMark: addressController.landMarkController.text,
                        );
                        addressController.addAddress(address);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
