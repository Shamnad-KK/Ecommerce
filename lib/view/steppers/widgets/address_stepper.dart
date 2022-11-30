import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/view/address/address_screen.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressStepperWidget extends StatelessWidget {
  const AddressStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AddressWidget();
  }
}
