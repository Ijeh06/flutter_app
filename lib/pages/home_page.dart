import 'package:flutter/material.dart';
import 'package:flutter_app/components/player_item_tile.dart';
import 'package:flutter_app/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.black,
      //   child: const Icon(Icons.shopping_bag),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            //Good Morning Player
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning,"),
            ),

            //Let's get a Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Order a fresh Player card Today.....",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
