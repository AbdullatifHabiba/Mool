import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/widgets/home_widgets/cursoal_slider.dart';
import 'package:mool/widgets/home_widgets/delivery_banner.dart';
import 'package:mool/widgets/home_widgets/top_brands.dart';

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

  Widget buildProductListView(bool isBest) {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildProductItem('Red Dress', Images.accessories, '2500', isBest),
          buildProductItem('Yellow Dress', Images.brand, '2500', isBest),
          buildProductItem('Yellow Dress', Images.accessories, '2500', isBest),
          buildProductItem('Red Dress', Images.brand, '2500', isBest),
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
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }

 Widget buildProductItem(String title, String imagePath, String price, bool isBest) {
  return Container(
    width: 180,
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                width: 180,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            if (isBest) 
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '20%',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite_border, size: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isBest)
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    isBest ? '${(double.parse(price) * 0.8).toStringAsFixed(2)} SAR' : '$price SAR',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}}
