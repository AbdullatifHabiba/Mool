import 'package:flutter/material.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black54, // Customize the color as needed
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const CustomBackArrow(),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 28, color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // Customize the style as needed
          ),
        ],
      ),
    );
  }
}
