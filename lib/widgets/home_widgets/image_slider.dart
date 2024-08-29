import 'package:flutter/material.dart';

class ImageSliderItem extends StatelessWidget {
  final String imagePath;

  const ImageSliderItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}