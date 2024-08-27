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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
