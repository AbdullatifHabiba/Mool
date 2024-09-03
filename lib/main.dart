import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MoolApp()));
}

class MoolApp extends StatelessWidget {
  const MoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mool',
      theme: appTheme(),
      home: const SplashScreen(),
    );
  }
}

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.black, // Primary app color
    scaffoldBackgroundColor: Colors.grey[200], // Scaffold background color
    fontFamily: 'Roboto', // Set a global font family

    // AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF292D32),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),

    // TextButton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor:const Color.fromARGB(100, 13, 14, 15),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),

    // ElevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        side:const BorderSide(color: Colors.black),
      ),
    ),

    // Input decoration theme for text fields
    inputDecorationTheme: InputDecorationTheme(
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
    // Bottom navigation bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF292D32), // Background from Figma
      selectedItemColor: Color(0xFF33CCCC), // Color used in "Vector"
      unselectedItemColor: Colors.white, // Common color used in Vectors
      selectedIconTheme: IconThemeData(
        size: 24, // Matching icon sizes from Figma
      ),
      unselectedIconTheme: IconThemeData(
        size: 24, // Matching icon sizes from Figma
      ),
      showSelectedLabels: true, // Showing selected labels
      showUnselectedLabels: false, // Hiding unselected labels
      type: BottomNavigationBarType
          .fixed, // Fixed to accommodate absolute positioning
      elevation: 0, 
    ),
  );
}
