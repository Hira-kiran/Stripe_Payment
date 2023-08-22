import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/stripe_pyment.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51MdYYoEO9c8tps039Vk4RHPQJxRx7i1OFLp0YRE49sZd0t3DrZOLtjysGYWOsMqHwUDhTzAhk1KLmyRhTiObHoqp00TM2S7rZ8';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stripe App',
      home: StripePaymentScreen(),
    );
  } 
}
// 177860