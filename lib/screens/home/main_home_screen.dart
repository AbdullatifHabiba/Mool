import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/widgets/home_widgets/cursoal_slider.dart';
import 'package:mool/widgets/home_widgets/delivery_banner.dart';
import 'package:mool/widgets/home_widgets/top_brands.dart';
import 'package:mool/widgets/home_widgets/product_item.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          const CategoryTiles(),
          const TopBrands(),
          const DiscountBanner(),
          buildSectionTitle('New Arrival'),
          buildProductListView(false),
          const SizedBox(height: 16),
          buildSectionTitle('Best Sellers'),
          buildProductListView(true),
          const SizedBox(height: 80),
        ],
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

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: () {}, child: const Text('See All'))
        ],
      ),
    );
  }

  Widget buildProductListView(bool isBest) {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProductItem(title: 'Red Dress', imagePath: Images.accessories, price: '2500', isBest: isBest),
          ProductItem(title: 'Yellow Dress', imagePath: Images.brand, price: '2500', isBest: isBest),
          ProductItem(title: 'Yellow Dress', imagePath: Images.accessories, price: '2500', isBest: isBest),
          ProductItem(title: 'Red Dress', imagePath: Images.brand, price: '2500', isBest: isBest),
        ],
      ),
    );
  }

  Widget buildTrendItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 48, height: 48),
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
