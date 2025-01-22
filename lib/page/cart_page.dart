import 'package:flutter/material.dart';
import 'package:foode/components/my_button.dart';
import 'package:foode/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_cart_tile.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

      //scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart', textAlign: TextAlign.center),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear all cart button
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title:
                            const Text("Are you sure you want to clear cart?"),
                        actions: [
                          //cancel
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          //yes
                          TextButton(
                            onPressed: () {
                              restaurant.clearCart();
                              Navigator.pop(context);
                            },
                            child: const Text("Yes"),
                          ),
                        ]),
                  );
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: Column(
          //list of cart
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text("Cart is empty...",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ))
                      : const SizedBox.shrink(),
                  Expanded(
                    child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //get individual cart Item
                          final cartItem = userCart[index];
                          //return cart item UI
                          return MyCartTile(cartItem: cartItem);
                        }),
                  )
                ],
              ),
            ),
            // button to pay
            MyButton(
              onTap: () {
                //go to checkout
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()));
                const SizedBox(
                  height: 25,
                );
              },
              text: "Go to Checkout",
            ),
            const SizedBox(height: 25,)
          ],
        ),
      );
    });
  }
}
