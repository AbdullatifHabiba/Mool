import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/states/items_list.dart';

class FilterDetailScreen extends ConsumerWidget {
  final String filterType;

  const FilterDetailScreen({super.key, required this.filterType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select $filterType'),
      ),
      body: ListView(
        children: _buildFilterOptions(context, ref),
      ),
    );
  }

  List<Widget> _buildFilterOptions(BuildContext context, WidgetRef ref) {
    // Customize this method to return specific filter options based on the filterType
    switch (filterType) {
      case 'category':
        return _buildCategoryOptions(context, ref);
      case 'brand':
        return _buildBrandOptions(context, ref);
      case 'priceRange':
        return _buildPriceOptions(context, ref);
      case 'rating':
        return _buildRatingOptions(context, ref);
      case 'size':
        return _buildSizeOptions(context, ref);
      case 'color':
        return _buildColorOptions(context, ref);
      default:
        return [];
    }
  }

  List<Widget> _buildCategoryOptions(BuildContext context, WidgetRef ref) {
    final categories = ['All', 'Tops', 'Dresses', 'Bottoms', 'T-Shirts'];
    return categories.map((category) {
      return ListTile(
        title: Text(category),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('category', category);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  List<Widget> _buildBrandOptions(BuildContext context, WidgetRef ref) {
    final brands = ['Brand A', 'Brand B'];
    return brands.map((brand) {
      return ListTile(
        title: Text(brand),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('brand', brand);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  List<Widget> _buildPriceOptions(BuildContext context, WidgetRef ref) {
    final priceRanges = ['0 - 50', '50 - 100', '100 - 500', '500 - 1000', '1000+'];
    return priceRanges.map((priceRange) {
      return ListTile(
        title: Text(priceRange),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('priceRange', priceRange);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  List<Widget> _buildRatingOptions(BuildContext context, WidgetRef ref) {
    final ratings = ['4.0', '3.0'];
    return ratings.map((rating) {
      return ListTile(
        title: Text('$rating+ Stars'),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('rating', rating);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  List<Widget> _buildSizeOptions(BuildContext context, WidgetRef ref) {
    final sizes = ['Small', 'Medium', 'Large'];
    return sizes.map((size) {
      return ListTile(
        title: Text(size),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('size', size);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  List<Widget> _buildColorOptions(BuildContext context, WidgetRef ref) {
    final colors = ['Red', 'Blue'];
    return colors.map((color) {
      return ListTile(
        title: Text(color),
        onTap: () {
          ref.read(filterProvider.notifier).setFilter('color', color);
          _applyFilters(ref);
          Navigator.of(context).pop();
        },
      );
    }).toList();
  }

  void _applyFilters(WidgetRef ref) {
    final filterNotifier = ref.read(filterProvider.notifier);
    ref.read(productListProvider.notifier).filterProducts(
      category: filterNotifier.getFilter('category'),
      brand: filterNotifier.getFilter('brand'),
      priceRange: filterNotifier.getFilter('priceRange'),
      rating: filterNotifier.getFilter('rating'),
      size: filterNotifier.getFilter('size'),
      color: filterNotifier.getFilter('color'),
    );
  }
}