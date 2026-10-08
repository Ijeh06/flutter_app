import 'package:flutter/material.dart';
import 'package:flutter_app/components/player_item_tile.dart';
import 'package:flutter_app/model/cart_model.dart';
import 'package:flutter_app/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Good Morning lad
            // const Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //   child: Text("Good Morning,"),
            // ),

            // Let's get a card Today
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Order a fresh player card Today..",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            //divider
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              // child: Divider(),
            ),
            //fres Cards + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Card for Cheap Rate",
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.3,
                        ),
                    itemBuilder: (context, index) {
                      //get individual item
                      final item = value.shopItems[index];

                      return PlayerItemTile(
                        itemName: item.name,
                        itemPrice: item.price,
                        imagePath: item.imagePath,
                        color: item.color,
                        onPressed: () {
                          Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).addItemToCart(index);
                          // Handle button press event
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
