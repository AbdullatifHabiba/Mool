import 'package:flutter/material.dart';

class SortingScreen extends StatelessWidget {
  const SortingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          buildSortingOption('Price: Low to High'),
          buildSortingOption('Price: High to Low'),
          buildSortingOption('New Arrival'),
          buildSortingOption('Rating: High to Low'),
        ],
      ),
    );
  }

  Widget buildSortingOption(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: '', // Provide selected value
      onChanged: (newValue) {
        // Handle sorting option change
      },
    );
  }
}
