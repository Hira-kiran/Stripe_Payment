import 'package:flutter/material.dart';
import 'package:stripe_payment/payment_function.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment Screen"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              StripePayment().makePayment();
            },
            child: const Text("Make Payment")),
      ),
    );
  }
}
