import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/widgets/cursoal_slider.dart';
import 'package:mool/constants/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(Images.logo, height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTopBrandsSection(),
            const SizedBox(height: 16),

            const CarouselSliderWidget(
              mediaPaths: [
                Images.background,
                Images.person,
                Images.background,
              ],
            ),

            const SizedBox(height: 16),
            // New Arrival Section
            buildSectionTitle('New Arrival'),
            buildProductListView(),
            const SizedBox(height: 16),
            // Best Sellers Section
            buildSectionTitle('Best Sellers'),
            buildProductListView(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
      height: 90, // Adjust height based on your design
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
      height: 116, // Adjust height based on your design
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildProductItem('Red Dress', Images.person, '2500 SAR'),
          buildProductItem('Yellow Dress', Images.person, '2500 SAR'),
          buildProductItem('Red Dress', Images.person, '2500 SAR'),
          buildProductItem('Yellow Dress', Images.person, '2500 SAR'),
          // Add more products as needed
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
