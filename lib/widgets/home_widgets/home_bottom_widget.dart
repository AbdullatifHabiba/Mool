import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:
          20, // Adjust this value to control how much space is under the bottom nav
      left: 20, // Adjust padding from left
      right: 20, // Adjust padding from right
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          elevation: 0, // No elevation to keep it flat
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_rounded), label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
