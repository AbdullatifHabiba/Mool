import 'package:flutter/material.dart';

class SocialIconsWidget extends StatelessWidget {
  const SocialIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black, // Background color
            shape: BoxShape.circle, // Circular shape
          ),
          child: IconButton(
            icon: const Icon(Icons.g_mobiledata,
                color: Colors.white), // Icon color
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black, // Background color
            shape: BoxShape.circle, // Circular shape
          ),
          child: IconButton(
            icon: const Icon(Icons.apple,
                color: Colors.white), // Icon color
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black, // Background color
            shape: BoxShape.circle, // Circular shape
          ),
          child: IconButton(
            icon: const Icon(Icons.facebook,
                color: Colors.white), // Icon color
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}