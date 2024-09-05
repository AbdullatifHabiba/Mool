import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/home/search_screen.dart';
import 'package:mool/states/items_list.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import 'package:mool/widgets/home_widgets/product_item.dart';

class MyListItemsScreen extends ConsumerWidget {
  const MyListItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProducts = ref.watch(favoriteProductsProvider);
    final filters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My List'),
        leading: const CustomBackArrow(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryFilter(
                      context, ref, 'All', true), 
                        buildCategoryFilter(
                      context, ref, 'Tops', filters['category'] == 'Tops'),
                  buildCategoryFilter(context, ref, 'Dresses',
                      filters['category'] == 'Dresses'),
                  buildCategoryFilter(context, ref, 'Bottoms',
                      filters['category'] == 'Bottoms'),
                  buildCategoryFilter(context, ref, 'T-Shirts',
                      filters['category'] == 'T-Shirts'),
                ],
              ),
            ),
          ),

          // Product Grid
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildProductListView(favoriteProducts),
          )),
        ],
      ),
    );
  }

  Widget buildProductListView(List<Product> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(
          product: product,
        );
      },
    );
  }

  Widget buildCategoryFilter(
      BuildContext context, WidgetRef ref, String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        ref.read(filterProvider.notifier).setFilter('category', title);
        ref.read(favoriteProductsProvider.notifier).filterFavoriteProducts(
              category: title,
            );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}