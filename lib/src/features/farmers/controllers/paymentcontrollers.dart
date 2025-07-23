import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart'; // Required for BuildContext

class PaymentController extends GetxController {
  late Razorpay razorpay;
  late BuildContext context;

  // Inject context before using (if needed)
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  @override
  void onInit() {
    super.onInit();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  void openCheckout(amount) {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag', // ✅ Test key
      'amount': amount*100, // Minimum is 100 paise = ₹1
      'name': 'Test Corp.',
      'description': 'Test Transaction',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '9999999999',
        'email': 'test@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    _showAlertDialog("Payment Failed", 
      "Code: ${response.code}\n"
      "Description: ${response.message}\n"
      "Metadata: ${response.error.toString()}"
      );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    _showAlertDialog("Payment Successful", 
      "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    _showAlertDialog("External Wallet Selected", 
      "${response.walletName}");
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
      ),
    );
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}
