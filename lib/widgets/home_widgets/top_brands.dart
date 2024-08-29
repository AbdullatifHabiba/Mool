import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CategoryTile(
            title: 'VACATION WEAR',
            imageUrl: Images.accessories,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CategoryTile(
            title: 'ACCESSORIES',
            imageUrl: Images.accessories,
          ),
        ),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryTile({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

class TopBrands extends StatelessWidget {
  const TopBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      color: Colors.yellow[100],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text('Top Brands', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
          SizedBox(height: 10),
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 10,
              children: [
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
                BrandLogo(logoUrl: Images.brand),
            
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrandLogo extends StatelessWidget {
  final String logoUrl;

  const BrandLogo({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(logoUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Get up to 15% off with code : ',
            style: TextStyle(color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.yellow,
            child: const Text(
              'GET15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}