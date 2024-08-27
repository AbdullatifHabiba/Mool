import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsets margin;

  const CustomImageView({
    super.key,
    required this.imagePath,
    this.height = 100.0,
    this.width = double.infinity,
    this.alignment = Alignment.center,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
      ),
    );
  }
}
