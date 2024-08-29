import 'package:flutter/material.dart';

class DeliveryBanner extends StatelessWidget {
  const DeliveryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white, // Background color for the banner
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_shipping_outlined, // Example icon, change as needed
            color: Colors.grey,
            size: 24,
            textDirection: TextDirection.ltr,
             // Icon size
          ),
          SizedBox(width: 8), // Space between the icon and text
          Text(
            '48 HOURS DELIVERY',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16, // Font size
            ),
          ),
        ],
      ),
    );
  }
}
