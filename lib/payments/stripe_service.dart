import 'dart:convert';
import 'package:http/http.dart' as http;

class StripeService {
  //Creating payment intent
  Future<dynamic> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": (int.parse(amount) * 100).toString(),
        "currency": currency,
        "payment_method_types[]": "card"
      };
      const String secret_key =
          "sk_test_51RdlogCelSyhQgxfwbXHEgaaN3XYzQSo6tUXw9qFYhOOL9kym7CbHwMieO3QtbAbNPV9bpUUKpoefojEYGJpIZlP00qW0Z6899";
      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer $secret_key",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: body,
      );
      print(response.body);
      return await jsonDecode(response.body);
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }
}
