import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/home/filter_screen.dart';
import 'package:mool/screens/home/search_screen.dart';
import 'package:mool/screens/home/sort_screen.dart';
import 'package:mool/states/items_list.dart';
import 'package:mool/widgets/home_widgets/product_item.dart';

class ListItemsScreen extends ConsumerWidget {
  final bool showBestSellers;

  const ListItemsScreen({super.key, required this.showBestSellers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider);
    final filters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(showBestSellers ? 'Best Sellers' : 'New Arrivals'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                      context, ref, 'All', filters['category'] == 'All'),
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
            child: buildProductListView(products),
          )),

          // Bottom Action Bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBottomAction('SORT', Icons.sort,
                    context: context, ref: ref),
                const SizedBox(
                  width: 100,
                  child: Text(
                    ' | ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildBottomAction('FILTER', Icons.filter_alt_outlined,
                    context: context, ref: ref),
              ],
            ),
          ),
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
          title: product.title,
          imagePath: product.imagePath,
          price: product.price.toString(),
          isBest: showBestSellers,
        );
      },
    );
  }

  Widget buildCategoryFilter(
      BuildContext context, WidgetRef ref, String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        ref.read(filterProvider.notifier).setFilter('category', title);
        ref.read(productListProvider.notifier).filterProducts(
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

  Widget buildBottomAction(String title, IconData icon,
      {required BuildContext context, required WidgetRef ref}) {
    return GestureDetector(
      onTap: () {
        if (title == 'SORT') {
          showModalBottomSheet(
            context: context,
            builder: (context) => const SortingScreen(),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const FilterScreen(),
            ),
          );
        }
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
