import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressStepperWidget extends StatelessWidget {
  const AddressStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddressController>(
      builder: (context, value, child) {
        if (value.addressList.isEmpty) {
          return const CustomNotFoundWidget(
            title: "Address Not Found",
            subtitle: "You haven't added any address",
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final Address address = value.addressList[index];
              return Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: AppPadding.mainPading,
                      child: Center(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.blackColor,
                            radius: 28,
                            child: CircleAvatar(
                              backgroundColor: AppColors.whiteColor,
                              radius: 23,
                              child: Icon(Icons.location_on),
                            ),
                          ),
                          title: Text(
                            address.address,
                            style: AppTextStyle.body1,
                          ),
                          subtitle: Text(
                            address.landMark,
                            style: AppTextStyle.subtitle2,
                          ),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.edit_location_alt_outlined,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.kHeight10,
                ],
              );
            },
            itemCount: value.addressList.length,
          );
        }
      },
    );
  }
}
