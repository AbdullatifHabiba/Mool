import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/states/items_list.dart';

class SortingScreen extends ConsumerWidget {
  const SortingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSort = ref.watch(sortProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          buildSortingOption(context, ref, 'Price: Low to High', selectedSort),
          buildSortingOption(context, ref, 'Price: High to Low', selectedSort),
          buildSortingOption(context, ref, 'New Arrival', selectedSort),
          buildSortingOption(context, ref, 'Rating: High to Low', selectedSort),
        ],
      ),
    );
  }

  Widget buildSortingOption(BuildContext context, WidgetRef ref, String title, String selectedSort) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: selectedSort,
      onChanged: (value) {
        ref.read(sortProvider.notifier).setSort(title);
        ref.read(productListProvider.notifier).sortProducts(title);
        Navigator.of(context).pop();
      },
    );
  }
}