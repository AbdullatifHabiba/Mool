import 'package:flutter/material.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading:CustomBackArrow(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}