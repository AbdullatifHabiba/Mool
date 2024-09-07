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
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _buildFilterOptions(context, ref),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _applyFilters(ref);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilterOptions(BuildContext context, WidgetRef ref) {
    switch (filterType) {
      case 'category':
        return _buildOptions(context, ref, 'category', ['All', 'Tops', 'Dresses', 'Bottoms', 'T-Shirts']);
      case 'brand':
        return _buildOptions(context, ref, 'brand', ['Brand A', 'Brand B']);
      case 'priceRange':
        return _buildOptions(context, ref, 'priceRange', ['0 - 50', '50 - 100', '100 - 500', '500 - 1000', '1000+']);
      case 'rating':
        return _buildOptions(context, ref, 'rating', ['4.0', '3.0'], suffix: '+ Stars');
      case 'size':
        return _buildOptions(context, ref, 'size', ['Small', 'Medium', 'Large']);
      case 'color':
        return _buildOptions(context, ref, 'color', ['Red', 'Blue']);
      default:
        return [];
    }
  }

  List<Widget> _buildOptions(BuildContext context, WidgetRef ref, String filterKey, List<String> options, {String suffix = ''}) {
    return options.map((option) {
      return ListTile(
        title: Text('$option$suffix'),
        trailing: Checkbox(
          value: ref.watch(filterProvider).containsValue(option),
          onChanged: (bool? value) {
            if (value == true) {
              ref.read(filterProvider.notifier).setFilter(filterKey, option);
            } else {
              ref.read(filterProvider.notifier).setFilter(filterKey, '');
            }
          },
        ),
        tileColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        onTap: () {
          if (ref.watch(filterProvider).containsValue(option) ) {
            ref.read(filterProvider.notifier).setFilter(filterKey, '');
          } else {
            ref.read(filterProvider.notifier).setFilter(filterKey, option);
          }
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
