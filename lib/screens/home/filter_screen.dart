import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/home/filter_detiels_screen.dart';
import 'package:mool/states/items_list.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
           
              children: [
                buildFilterOption(context, 'category', ref),
                buildFilterOption(context, 'brand', ref),
                buildFilterOption(context, 'priceRange', ref),
                buildFilterOption(context, 'rating', ref),
                buildFilterOption(context, 'size', ref),
                buildFilterOption(context, 'color', ref),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Reset all filters logic here
                    ref.read(filterProvider.notifier).resetFilters();
                    ref.read(productListProvider.notifier).filterProducts();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Apply filters logic here
                    final filterNotifier = ref.read(filterProvider.notifier);
                    ref.read(productListProvider.notifier).filterProducts(
                      category: filterNotifier.getFilter('category'),
                      brand: filterNotifier.getFilter('brand'),
                      priceRange: filterNotifier.getFilter('priceRange'),
                      rating: filterNotifier.getFilter('rating'),
                      size: filterNotifier.getFilter('size'),
                      color: filterNotifier.getFilter('color'),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterOption(BuildContext context, String filterType, WidgetRef ref) {
    final value = ref.watch(filterProvider)[filterType];
    return ListTile(
      title: Text('$filterType ($value)'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to the specific filter page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FilterDetailScreen(filterType: filterType),
          ),
        );
      },
    );
  }
}