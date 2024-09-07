import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/interfaces/product.dart';
import 'package:mool/widgets/custom_fav_button.dart';

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.card_travel),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 80.0), // Add padding to avoid overlap with the button
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Carousel with love icon overlay
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        color:
                            Colors.grey[300], // Placeholder for product image
                        child: Image.asset(
                          product.imagePath,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomFavButton(
                        product: product,
                        bottom: 10,
                        right: 10,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Product Title and Price
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${product.price} SAR',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('ZARA'),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_border, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('4.0 (23 reviews)'),
                    ],
                  ),
                  const Divider(thickness: 5),
                  // Return policy
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Return Policy'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const Divider(thickness: 5),
                  // Size Selection
                  const Text('Size'),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Chip(label: Text('XS')),
                      SizedBox(width: 8),
                      Chip(label: Text('S')),
                      SizedBox(width: 8),
                      Chip(label: Text('M')),
                      SizedBox(width: 8),
                      Chip(label: Text('L')),
                      SizedBox(width: 8),
                      Chip(label: Text('XL')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Color Selection
                  const Text('Color'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildColorOption(Colors.brown),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.black),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.white),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'ZARA elegant Two-Button Fitted Blazer for Women. ZARA elegant Two-Button Fitted Blazer for Women',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Product Details
                  const Text(
                    'Product Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(child: Text('Product Code: 458754485')),
                      Expanded(child: Text('Brand: Zara')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(child: Text('Fabric: Cotton')),
                      Expanded(child: Text('Model wearing size: S')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(child: Text('Shape: Tiered')),
                      Expanded(child: Text('Shape: Tiered')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 5),
                  // Rating
                  const Text(
                    'Rating',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 8),
                      Text('3.95', style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildRatingBreakdown(),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  // Reviews
                  const Text(
                    'Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildReview(),
                  const SizedBox(height: 8),
                  const Divider(thickness: 2),
                  const TextButton(
                    onPressed: null, // Replace with your action
                    child: Text('See all reviews'),
                  ),
                  const Divider(thickness: 10),
                  const TextButton(
                    onPressed: null, // Replace with your action
                    child: Text('Write Review',
                        style: TextStyle(color: Colors.blue)),
                  ),
                  const Divider(thickness: 10),
                  // Safety and Return Policy
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.security, size: 40),
                          SizedBox(height: 8),
                          Text('Safe packaging'),
                          Text('Orders are sanitized and packed'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.cached, size: 40),
                          SizedBox(height: 8),
                          Text('Easy Return'),
                          Text('15 Days Easy Return'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Add to cart'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  Widget _buildRatingBreakdown() {
    return Column(
      children: [
        _buildRatingRow(5, 0.5),
        _buildRatingRow(4, 0.3),
        _buildRatingRow(3, 0.1),
        _buildRatingRow(2, 0.05),
        _buildRatingRow(1, 0.05),
      ],
    );
  }

  Widget _buildRatingRow(int star, double percentage) {
    return Row(
      children: [
        Text('$star Star'),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(value: percentage),
        ),
        const SizedBox(width: 8),
        Text('${(percentage * 100).toInt()}%'),
      ],
    );
  }

  Widget _buildReview() {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Nourhan Selim'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text('1st August 2022'),
          SizedBox(height: 8),
          Text(
            'Very elegant product',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Very nice and elegant product and the fabric is awesome'),
        ],
      ),
    );
  }
}
