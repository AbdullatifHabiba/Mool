import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/home/filter_detiels_screen.dart';
import 'package:mool/states/items_list.dart';
import 'package:mool/widgets/Custom_elevated_button.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(productListProvider).length;

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
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
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      // Reset all filters logic here
                      ref.read(filterProvider.notifier).resetFilters();
                      ref.read(productListProvider.notifier).filterProducts();
                      // Navigator.of(context).pop();
                    },
                    text: 'Reset',
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomElevatedButton(
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
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
                    text: '$size items      Apply',
                  ),
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
      // show ( )  only if the filter is selected
      title: Text('$filterType ${value == null || value=='' ? '' : '($value)'}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      tileColor: Colors.white,
      // bottom border
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
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