import 'package:ecommerce/controller/stepper_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/view/steppers/utils/payment_type_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentStepperWidget extends StatelessWidget {
  const PaymentStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPadding.mainPading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<StepperController>(
              builder: (BuildContext context, value, Widget? child) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Radio(
                        value: PaymentType.ONLINE_PAYMENT,
                        groupValue: value.paymentType,
                        onChanged: (newValue) {
                          value.setPaymentType(newValue!);
                        },
                      ),
                      title: const Text("Razorpay"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Radio(
                        value: PaymentType.CASH_ON_DELIVERY,
                        groupValue: value.paymentType,
                        onChanged: (newValue) {
                          value.setPaymentType(newValue!);
                        },
                      ),
                      title: const Text("Cash on Delivery"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
