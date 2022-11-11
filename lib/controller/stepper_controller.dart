import 'package:ecommerce/services/payment_services.dart';
import 'package:ecommerce/view/steppers/utils/payment_type_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StepperController extends ChangeNotifier {
  PaymentServices paymentServices = PaymentServices();
  late Razorpay razorpay;

  PaymentType paymentType = PaymentType.ONLINE_PAYMENT;
  int currentStep = 0;

  void setStep(int newStep) {
    currentStep = newStep;
    notifyListeners();
  }

  void stepContinued() {
    if (currentStep < 2) {
      currentStep++;
    } else if (paymentType == PaymentType.ONLINE_PAYMENT) {
      currentStep < 2
          ? currentStep++
          : PaymentServices().openRazorPay(razorpay);
    }

    notifyListeners();
  }

  void stepCancel(BuildContext context) {
    currentStep > 0 ? currentStep-- : Navigator.pop(context);
    notifyListeners();
  }

  void setPaymentType(PaymentType newPaymentType) {
    paymentType = newPaymentType;
    notifyListeners();
  }

  void initRazorPay() {
    paymentServices.initRazorPay(razorpay);
  }

  void openRazorPay() {
    paymentServices.openRazorPay(razorpay);
  }
}
