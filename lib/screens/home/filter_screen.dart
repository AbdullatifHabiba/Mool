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
                buildFilterOption(context, 'Category'),
                buildFilterOption(context, 'Brand'),
                buildFilterOption(context, 'Price'),
                buildFilterOption(context, 'Product Rating'),
                buildFilterOption(context, 'Size'),
                buildFilterOption(context, 'Color'),
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
                      isBest: filterNotifier.getFilter('isBest') == 'true',
                      isNew: filterNotifier.getFilter('isNew') == 'true',
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

  Widget buildFilterOption(BuildContext context, String filterType) {
    return ListTile(
      title: Text(filterType),
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