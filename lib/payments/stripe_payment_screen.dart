import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:practicee/payments/stripe_service.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  Map<String, dynamic> paymentIntent = {};
  final StripeService _stripeService = StripeService();
  Future<void> makePayment() async {
    try {
      paymentIntent = await _stripeService.createPaymentIntent("10", "USD");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "US",
            testEnv: true,
            currencyCode: "USD",
          ),
          merchantDisplayName: "Vipul Lokhande",
        ),
      );
      await displayPaymentSheet();
    } catch (e) {
      print("Error from payscreen ${e.toString()}");
    }
  }

  Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print("Error from sheet ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await makePayment();
            },
            child: const Text("Pay")),
      ),
    );
  }
}
