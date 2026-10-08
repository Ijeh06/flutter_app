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

  //list of items in the cart
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  //calculate total price

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
