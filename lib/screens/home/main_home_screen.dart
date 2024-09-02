import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/home/list_items_screen.dart';
import 'package:mool/widgets/home_widgets/cursoal_slider.dart';
import 'package:mool/widgets/home_widgets/delivery_banner.dart';
import 'package:mool/widgets/home_widgets/top_brands.dart';
import 'package:mool/widgets/home_widgets/product_item.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({
    super.key,
    // intializing the buildGenderTab
    required  this.buildGenderTab,
    
   
  });
  final  Function(String, int) buildGenderTab;

  @override
  Widget build(BuildContext context) {
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
              buildSectionTitle('New Arrival', context),
              buildProductListView(false),
              const SizedBox(height: 16),
              buildSectionTitle('Best Sellers', context),
              buildProductListView(true),
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

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: () {
            // Navigate to the product list screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListItemsScreen(showBestSellers: title=='Best Sellers'?true:false),
              ),
            );

          }, child: const Text('See All'))
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 48, height: 48),
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
