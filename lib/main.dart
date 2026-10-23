import 'package:flutter/material.dart';
import 'package:flutter_app/model/cart_model.dart';
import 'package:flutter_app/pages/intro_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

String publishable_key =
    "pk_test_51UTbwDJ9eVuuObqrP9UX6n7dOfqf0uum7rF4ZwBi2SRVhNMMbV2U1nwneIYVnf3wG9EiKJHZ5gKbx4UEaH7vvey700JABXFtUV";

String secret_key = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishable_key;
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}
