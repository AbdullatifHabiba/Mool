import 'package:flutter/material.dart';

class ListItemsScreen extends StatelessWidget {
  final bool showBestSellers;

  const ListItemsScreen({super.key, required this.showBestSellers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showBestSellers ? 'Best Sellers' : 'New Arrivals'),
      ),
      body: Center(
        child: Text(showBestSellers ? 'Displaying Best Sellers' : 'Displaying New Arrivals'),
      ),
    );
  }
}