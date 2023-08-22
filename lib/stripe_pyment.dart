import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  Map<String, dynamic>? paymentIntent;

  void makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
                  "sk_test_51MdYYoEO9c8tps038uOQo5cH2XwrYyJlSytOugOe8KJOTeXRZisfC4ahZOsZsGD4PcLWvoiEhjEqZNg5QNhxfgSI00nuydjjV2"],
              style: ThemeMode.light,
              merchantDisplayName: "Hira",
              googlePay: gpay));
      displayPaymentSheet();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      if (kDebugMode) {
        print("done");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Fa8iled $e");
      }
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        "amount": "1000",
        "currency": "USD",
      };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization":
                "Bearer sk_test_51MdYYoEO9c8tps038uOQo5cH2XwrYyJlSytOugOe8KJOTeXRZisfC4ahZOsZsGD4PcLWvoiEhjEqZNg5QNhxfgSI00nuydjjV2",
            "Content-Type": "application/x-www-form-urlencoded",
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment Screen"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              makePayment();
            },
            child: const Text("Make Payment")),
      ),
    );
  }
}
