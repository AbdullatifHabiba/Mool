import 'package:flutter/material.dart';

class SizeFilterScreen extends StatelessWidget {
  const SizeFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle cancel action
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: ListView(
        children: [
          buildSizeOption('10 (250)'),
          buildSizeOption('12 (250)'),
          buildSizeOption('14 (250)'),
          buildSizeOption('16 (250)'),
          buildSizeOption('8 (250)'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle apply action
          },
          child: const Text('Apply'),
        ),
      ),
    );
  }

  Widget buildSizeOption(String size) {
    return CheckboxListTile(
      title: Text(size),
      value: false,
      onChanged: (newValue) {
        // Handle size selection change
      },
    );
  }
}
