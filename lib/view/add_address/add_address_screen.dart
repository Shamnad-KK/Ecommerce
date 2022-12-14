import 'dart:developer';

import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:ecommerce/widgets/custom_outlined_button.dart';
import 'package:ecommerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late final AddressController addressController;
  @override
  void initState() {
    addressController = Provider.of<AddressController>(
      context,
      listen: false,
    );

    addressController.setCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('address build called');
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<AddressController>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Container(
                      height: 330,
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: AppColors.mainColor),
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: addressController.cameraPosition,
                        onMapCreated: (controller) {
                          log("map created successfully");
                          if (addressController.controller.isCompleted) {
                            return;
                          }
                          addressController.controller.complete(controller);
                        },
                        buildingsEnabled: true,
                        compassEnabled: true,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: true,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: addressController.markers,
                        onTap: (argument) {
                          addressController.addMarker(
                              argument.latitude, argument.longitude);
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: AppPadding.mainPading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(
                            child: Text(
                              "Address Details",
                              style: AppTextStyle.titleLarge,
                            ),
                          ),
                          CustomOutlinedButton(
                            text: "Pick current address",
                            onTap: () {
                              addressController.pickCurrentAddress();
                            },
                          )
                        ],
                      ),
                      AppSpacing.kHeight10,
                      Consumer<AddressController>(
                        builder: (BuildContext context, value, Widget? child) {
                          return value.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: CustomLoadingWidget(),
                                )
                              : Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppSpacing.kHeight10,
                                      CustomTextField(
                                        controller:
                                            addressController.nameController,
                                        hint: "Name",
                                        validator: (p0) => addressController
                                            .nameValidation(p0),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                      ),
                                      AppSpacing.kHeight10,
                                      CustomTextField(
                                        controller:
                                            addressController.addressController,
                                        hint: "Address",
                                        validator: (p0) => addressController
                                            .addressValidation(p0),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                      AppSpacing.kHeight10,
                                      CustomTextField(
                                        controller:
                                            addressController.pinCodeController,
                                        hint: "Pincode",
                                        validator: (p0) => addressController
                                            .pincodeValidation(p0),
                                        keyboardType: TextInputType.number,
                                      ),
                                      AppSpacing.kHeight10,
                                      CustomTextField(
                                        controller:
                                            addressController.cityController,
                                        hint: "City",
                                        validator: (p0) => addressController
                                            .cityValidation(p0),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                      ),
                                      AppSpacing.kHeight10,
                                      CustomTextField(
                                        controller:
                                            addressController.phoneController,
                                        hint: "Phone",
                                        validator: (p0) => addressController
                                            .phoneValidation(p0),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                      ),
                                      AppSpacing.kHeight50,
                                      CustomButtonWidget(
                                        text: "Add",
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            addressController
                                                .addAddress(context);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
