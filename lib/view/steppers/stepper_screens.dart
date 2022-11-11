import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/stepper_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/steppers/widgets/address_stepper.dart';
import 'package:ecommerce/view/steppers/widgets/order_summary_stepper.dart';
import 'package:ecommerce/view/steppers/widgets/payment_stepper.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StepperScreens extends StatefulWidget {
  const StepperScreens({super.key});

  @override
  State<StepperScreens> createState() => _StepperScreensState();
}

class _StepperScreensState extends State<StepperScreens> {
  late StepperController stepperController;

  @override
  void initState() {
    stepperController = Provider.of<StepperController>(context, listen: false);
    stepperController.razorpay = Razorpay();
    stepperController.initRazorPay();
    super.initState();
  }

  @override
  void dispose() {
    stepperController.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stepperController =
        Provider.of<StepperController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<StepperController>(context, listen: false)
                .stepCancel(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<StepperController>(
              builder: (BuildContext context, value, Widget? child) {
                return Stepper(
                  controlsBuilder: (context, details) {
                    return const SizedBox();
                  },
                  physics: const ScrollPhysics(),
                  type: StepperType.horizontal,
                  currentStep: value.currentStep,
                  onStepTapped: (newValue) {
                    value.setStep(newValue);
                  },
                  onStepContinue: () {
                    value.stepContinued();
                  },
                  onStepCancel: () {
                    value.stepCancel(context);
                  },
                  steps: <Step>[
                    Step(
                      title: const Text(
                        "Address",
                        style: AppTextStyle.stepperTitle,
                      ),
                      content: const AddressStepperWidget(),
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text(
                        "Order Summary",
                        style: AppTextStyle.stepperTitle,
                      ),
                      content: const OrderSummaryStepperWidget(),
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text(
                        "Payments",
                        style: AppTextStyle.stepperTitle,
                      ),
                      content: const PaymentStepperWidget(),
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    )
                  ],
                );
              },
            ),
          ),
          Consumer<AddressController>(
            builder: (BuildContext context, addressConsumer, Widget? child) {
              return Padding(
                padding: AppPadding.mainPading,
                child: CustomButtonWidget(
                  text: addressConsumer.addressList.isEmpty
                      ? "ADD ADDRESS"
                      : "CONTINUE",
                  onTap: () {
                    if (addressConsumer.addressList.isNotEmpty) {
                      stepperController.stepContinued();
                    } else {
                      Navigator.of(context)
                          .pushNamed(RouteNames.addAddressScreen);
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
