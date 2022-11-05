import 'package:ecommerce/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentController paymentController;

  @override
  void initState() {
    paymentController = Provider.of<PaymentController>(context, listen: false);
    paymentController.razorpay = Razorpay();
    paymentController.initRazorPay();
    super.initState();
  }

  @override
  void dispose() {
    paymentController.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            paymentController.openRazorPay();
          },
          child: const Text("Razor pay"),
        ),
      ),
    );
  }
}
