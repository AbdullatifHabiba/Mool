import 'package:flutter/material.dart';
import 'package:mool/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
    return Scaffold(
      body: SafeArea(
        child: Container(

          color: Colors.grey[900], // Assuming a dark background
          child: 
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: 150.0,
                  width: 200.0,
                ),
                // progress indicator can be added here
                CircularProgressIndicator()

              ],
            ),
          
            // progress indicator can be added here


          
        ),
      ),
    );
  }
}

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsets margin;

  const CustomImageView({
    super.key,
    required this.imagePath,
    this.height = 100.0,
    this.width = double.infinity,
    this.alignment = Alignment.center,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
      ),
    );
  }
}

class ImageConstant {
  static const String imgImage1 = 'assets/images/logo.png';
}
