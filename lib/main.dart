import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MoolApp());
}

class MoolApp extends StatelessWidget {
  const MoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mool',
      theme: appTheme()
      ,
      home: const SplashScreen(),
    );
  }
}
ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.black, // Primary app color
    scaffoldBackgroundColor: Colors.grey[200], // Scaffold background color
    fontFamily:'Roboto', // Set a global font family

    // AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black54,
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
        foregroundColor: Colors.green,
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
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),

    
  );
}