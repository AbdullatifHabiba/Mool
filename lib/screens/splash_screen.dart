import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/welcome_screen.dart';
import 'package:mool/widgets/custom_image_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => const WelcomeScreen()));
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
                  imagePath: Images.logo,
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


