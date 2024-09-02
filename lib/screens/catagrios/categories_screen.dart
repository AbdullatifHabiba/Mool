import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading:CustomBackArrow(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
     
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
        children: [
          buildCategoryItem('Dresses', Images.category),
          buildCategoryItem('Tops', Images.category),
          buildCategoryItem('Bottoms', Images.category),
          buildCategoryItem('Outerwear', Images.category),
          buildCategoryItem('Shoes', Images.category),
          buildCategoryItem('Accessories', Images.category),
        ],
      ),
    );
  }

  Widget buildCategoryItem(String title, String imagePath) {
    return Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white.withOpacity(0.5),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}