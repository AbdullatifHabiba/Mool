import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Discover'), leading: const CustomBackArrow()),
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              Images.video,
              fit: BoxFit.cover,
            ),
          ),
          // Bottom overlay with text
          const Positioned(
            bottom: 20,
            left: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Images.person),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Essam Ahmed',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'New sweat shirts that glow the winter',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Floating buttons
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'Products',
                        onPressed: () {
                          // Handle products button press
                        },
                        child: const Icon(Icons.shopping_bag,
                            color: Color.fromARGB(255, 5, 37, 6)),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the button and the text
                      const Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.white, // Adjust the color as needed
                          fontSize: 14, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'Grid',
                        onPressed: () {
                          // Handle grid button press
                        },
                        child: const Icon(Icons.grid_view,
                            color: Color.fromARGB(255, 5, 37, 6)),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the button and the text
                      const Text(
                        'Grid',
                        style: TextStyle(
                          color: Colors.white, // Adjust the color as needed
                          fontSize: 14, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'whatsapp',
                        onPressed: () {
                          // Handle whatsup button press
                        },
                        child: const Icon(Icons.wechat, color: Colors.green),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the button and the text
                      const Text(
                        'WhatsApp',
                        style: TextStyle(
                          color: Colors.white, // Adjust the color as needed
                          fontSize: 14, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
