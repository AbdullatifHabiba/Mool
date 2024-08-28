



import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/widgets/cursoal_slider.dart';
class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTopBrandsSection(),
          const SizedBox(height: 16),
          const CarouselSliderWidget(
            mediaPaths: [
              Images.background,
              Images.video,
              Images.person,
            ],
          ),
          const SizedBox(height: 16),
          buildSectionTitle('New Arrival'),
          buildProductListView(),
          const SizedBox(height: 16),
          buildSectionTitle('Best Sellers'),
          buildProductListView(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildSliderItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
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
          buildTrendItem('Dresees', Images.frame),
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

  Widget buildProductListView() {
    return SizedBox(
      height: 116,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildProductItem('Red Dress', Images.person, '2500 SAR'),
          buildProductItem('Yellow Dress', Images.person, '2500 SAR'),
          buildProductItem('Red Dress', Images.person, '2500 SAR'),
          buildProductItem('Yellow Dress', Images.person, '2500 SAR'),
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

  Widget buildProductItem(String title, String imagePath, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 100, height: 60),
          Text(title),
          Text(price),
        ],
      ),
    );
  }
}

 