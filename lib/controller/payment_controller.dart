import 'package:ecommerce/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends ChangeNotifier {
  PaymentServices paymentServices = PaymentServices();
  late Razorpay razorpay;

  void initRazorPay() {
    paymentServices.initRazorPay(razorpay);
  }

  void openRazorPay() {
    paymentServices.openRazorPay(razorpay);
  }
}
