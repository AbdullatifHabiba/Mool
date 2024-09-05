import 'package:flutter/material.dart';

class FilterDetailScreen extends StatelessWidget {
  final String filterType;

  const FilterDetailScreen({super.key, required this.filterType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select $filterType'),
      ),
      body: ListView(
        children: _buildFilterOptions(),
      ),
    );
  }

  List<Widget> _buildFilterOptions() {
    // Customize this method to return specific filter options based on the filterType
    switch (filterType) {
      case 'Category':
        return _buildCategoryOptions();
      case 'Brand':
        return _buildBrandOptions();
      case 'Price':
        return _buildPriceOptions();
      case 'Product Rating':
        return _buildRatingOptions();
      case 'Size':
        return _buildSizeOptions();
      case 'Color':
        return _buildColorOptions();
      default:
        return [];
    }
  }

  List<Widget> _buildCategoryOptions() {
    // Example of category options
    return [
      ListTile(title: const Text('All'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('Tops'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('Dresses'), onTap: () {/* Handle selection */}),
      // Add more categories as needed
    ];
  }

  // Define other filter options similarly

  List<Widget> _buildBrandOptions() {
    return [
      ListTile(title: const Text('Brand A'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('Brand B'), onTap: () {/* Handle selection */}),
      // Add more brands as needed
    ];
  }

  List<Widget> _buildPriceOptions() {
    return [
      ListTile(title: const Text('\$0 - \$50'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('\$50 - \$100'), onTap: () {/* Handle selection */}),
      // Add more price ranges as needed
    ];
  }

  List<Widget> _buildRatingOptions() {
    return [
      ListTile(title: const Text('4+ Stars'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('3+ Stars'), onTap: () {/* Handle selection */}),
      // Add more rating ranges as needed
    ];
  }

  List<Widget> _buildSizeOptions() {
    return [
      ListTile(title: const Text('Small'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('Medium'), onTap: () {/* Handle selection */}),
      // Add more sizes as needed
    ];
  }

  List<Widget> _buildColorOptions() {
    return [
      ListTile(title: const Text('Red'), onTap: () {/* Handle selection */}),
      ListTile(title: const Text('Blue'), onTap: () {/* Handle selection */}),
      // Add more colors as needed
    ];
  }
}
