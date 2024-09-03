import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/states/items_list.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);

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
                buildFilterOption(context, ref, 'Category', 'All', filters['category'] == 'All'),
                buildFilterOption(context, ref, 'Category', 'Tops', filters['category'] == 'Tops'),
                buildFilterOption(context, ref, 'Category', 'Dresses', filters['category'] == 'Dresses'),
                buildFilterOption(context, ref, 'Category', 'Bottoms', filters['category'] == 'Bottoms'),
                buildFilterOption(context, ref, 'Category', 'T-Shirts', filters['category'] == 'T-Shirts'),
               
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
                    ref.read(filterProvider.notifier).setFilter('category', 'All');
                   
                    ref.read(productListProvider.notifier).filterProducts(
                      category: 'All',
                    
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final filterNotifier = ref.read(filterProvider.notifier);
                    ref.read(productListProvider.notifier).filterProducts(
                      category: filterNotifier.state['category'],
                    
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

  Widget buildFilterOption(BuildContext context, WidgetRef ref, String filterType, String title, bool isSelected) {
    return ListTile(
      title: Text(title),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
      onTap: () {
        ref.read(filterProvider.notifier).setFilter(filterType.toLowerCase(), title);
        ref.read(productListProvider.notifier).filterProducts(
          category: filterType == 'Category' ? title : ref.read(filterProvider)['category'],
        
        );
        Navigator.of(context).pop();
      },
    );
  }
}