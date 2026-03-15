import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GoogleApplePayScreen extends StatelessWidget {
  GoogleApplePayScreen({super.key});

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('google_pay_payment_profile.json');

  final Future<PaymentConfiguration> _applePayConfigFuture =
      PaymentConfiguration.fromAsset('apple_pay_payment_profile.json');

  final List<PaymentItem> _paymentItems = const [
    PaymentItem(
      label: 'Total',
      amount: '1.00',
      status: PaymentItemStatus.final_price,
    ),
  ];

  void _onPaymentResult(Map<String, dynamic> result) {
    debugPrint(
      'Payment result: ${result['paymentMethodData']['tokenizationData']['token']}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Platform.isAndroid || Platform.isIOS;

    return Scaffold(
      appBar: AppBar(title: const Text('Unified Payments')),
      body: Center(
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// GOOGLE PAY
                  if (Platform.isAndroid)
                    FutureBuilder<PaymentConfiguration>(
                      future: _googlePayConfigFuture,
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return GooglePayButton(
                          paymentConfiguration: snapshot.data!,
                          paymentItems: _paymentItems,
                          type: GooglePayButtonType.pay,
                          onPaymentResult: _onPaymentResult,
                        );
                      },
                    ),

                  const SizedBox(height: 20),

                  /// APPLE PAY
                  if (Platform.isIOS)
                    FutureBuilder<PaymentConfiguration>(
                      future: _applePayConfigFuture,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return ApplePayButton(
                          paymentConfiguration: snapshot.data!,
                          paymentItems: _paymentItems,
                          type: ApplePayButtonType.buy,
                          onPaymentResult: _onPaymentResult,
                        );
                      },
                    ),
                ],
              )
            : const Text(
                'Google Pay / Apple Pay\n'
                'works only on real mobile devices',
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
