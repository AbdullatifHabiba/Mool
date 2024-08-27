import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;

  const CustomTextField({super.key, required this.label, this.obscureText = false});

   @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            fillColor: Colors.white, // Set background color to white
            filled: true, // Enable filling the background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Colors.white, // Set border color to white
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Colors.white, // Set border color to white
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Colors.white, // Set border color to white
              ),
            ),
          ),
        ),
      );
    }
}