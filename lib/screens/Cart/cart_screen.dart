import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/states/cart.dart';
import 'package:mool/widgets/cart_item_card.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProducts = ref.watch(cartProvider);
    final totalPrice = cartProducts.fold<double>(
      0.0,
      (sum, item) => sum + item.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        automaticallyImplyLeading: false,
        leading: CustomBackArrow(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: cartProducts.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$totalPrice SAR',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = cartProducts[index];
                      return CartItemCard(product: product);
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: cartProducts.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Proceed to checkout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
    );
  }
}
