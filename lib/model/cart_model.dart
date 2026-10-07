import 'package:flutter/material.dart';

class ShopItem {
  const ShopItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
  });

  final String name;
  final String price;
  final String imagePath;
  final Color color;
}

class CartModel extends ChangeNotifier {
  final List<ShopItem> _shopItems = [
    ShopItem(
      name: "Pelegrini,",
      price: "6.00",
      imagePath: "lib/images/Groundz.png",
      color: Colors.green,
    ),
    ShopItem(
      name: "Drogba,",
      price: "6.40",
      imagePath: "lib/images/drogba.png",
      color: Colors.deepOrange,
    ),
    ShopItem(
      name: "Carlos,",
      price: "7.40",
      imagePath: "lib/images/drogba.png",
      color: Colors.yellow,
    ),
    ShopItem(
      name: "Inter,",
      price: "6.00",
      imagePath: "lib/images/Groundz.png",
      color: Colors.blue,
    ),
  ];

  List<ShopItem> get shopItems => _shopItems;
}
