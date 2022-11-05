import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentServices {
  void initRazorPay(Razorpay razorpay) {
    try {
      void handlePaymentSuccess(PaymentSuccessResponse response) {
        // Do something when payment succeeds
      }

      void handlePaymentError(PaymentFailureResponse response) {
        // Do something when payment fails
      }

      void handleExternalWallet(ExternalWalletResponse response) {
        // Do something when an external wallet was selected
      }

      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    } catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
  }

  void openRazorPay(Razorpay razorpay) {
    try {
      final options = {
        'key': 'rzp_test_qhw0ndv4yjv2zV',
        'amount': num.parse("100") * 100,
        'name': 'Clothify',
        'description': 'Fine T-Shirt',
        'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
      };

      razorpay.open(options);
    } catch (e) {
      AppPopUps.showToast(e.toString(), Colors.red);
    }
  }
}
