import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/home/list_items_screen.dart';
import 'package:mool/states/items_list.dart';
import 'package:mool/widgets/home_widgets/cursoal_slider.dart';
import 'package:mool/widgets/home_widgets/delivery_banner.dart';
import 'package:mool/widgets/home_widgets/top_brands.dart';
import 'package:mool/widgets/home_widgets/product_item.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({
    super.key,
    required this.buildGenderTab,
  });

  final Function(String, int) buildGenderTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the providers
    // final selectedGenderTab = ref.watch(selectedGenderTabProvider);
    // final isBestSellers = ref.watch(isBestSellersProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTopBrandsSection(),
              const DeliveryBanner(),
              const CarouselSliderWidget(
                mediaPaths: [
                  Images.background,
                  Images.video,
                  Images.person,
                ],
              ),
              const SizedBox(height: 16),
              const CategoryTiles(),
              const SizedBox(height: 16),
              const TopBrands(),
              const DiscountBanner(),
              buildSectionTitle('New Arrival', context, ref),
              buildProductListView(ref, false),
              const SizedBox(height: 16),
              buildSectionTitle('Best Sellers', context, ref),
              buildProductListView(ref, true),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopBrandsSection() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTrendItem('Sales', Images.frame),
          buildTrendItem('Dresses', Images.frame),
          buildTrendItem('Tops', Images.frame),
          buildTrendItem('Bottoms', Images.frame),
          buildTrendItem('Shoes', Images.frame),
          buildTrendItem('Accessories', Images.frame),
          buildTrendItem('Bags', Images.frame),
          buildTrendItem('Beauty', Images.frame),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              // Set the state of the "Best Sellers" or "New Arrivals" based on the title
              ref.read(isBestSellersProvider.notifier).state =
                  title == 'Best Sellers';
              // Navigate to the product list screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListItemsScreen(
                    showBestSellers: ref.read(isBestSellersProvider),
                  ),
                ),
              );
            },
            child: const Text('See All'),
          ),
        ],
      ),
    );
  }

  Widget buildProductListView(WidgetRef ref, bool isBest) {
    final products = ref.watch(productListProvider);
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(
            title: product.title,
            imagePath: product.imagePath,
            price: product.price.toString(),
            isBest: isBest,
          );
        },
      ),
    );
  }

  Widget buildTrendItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 48, height: 48),
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}