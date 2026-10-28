import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secret_key',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'amount': amount, 'currency': currency},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['client_secret'];
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<void> makePayment(int amount, String currency) async {
    try {
      final clientSecret = await createPaymentIntent(amount, currency);

      if (clientSecret == null) {
        throw Exception('Failed to create payment intent');
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Shooping App',
          style: ThemeMode.system,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
