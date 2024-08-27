import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mool/screens/country_selection_screen.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        color: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 50.0,
                    width: 100.0,
                  ),
                  SizedBox(
                    width: 300,
                    height: 350.0,
                    // Read svg file
                    child: Stack(
                      children: [
                        Positioned(
                            left: 60,
                            child: SvgPicture.asset(
                              'assets/images/welcome.svg',
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          left: 70, // Adjust the position as needed
                          top: 10, // Adjust the position as needed
                          child: Image.asset(
                            'assets/images/person.png', // Update with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Add the new image
                        Positioned(
                          top: 10,
                          right: 50,
                          child: Image.asset(
                            'assets/images/person.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Text(
                      'Find the best Collection',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Get your dream items easily with Mool and get other interesting offers',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height:
                            1.5, // Adding some line height for better readability
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CountrySelectionScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(160.0, 50.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Text('Sign Up'),
                        ),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(160.0, 50.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Handle Continue as Guest
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Continue as ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Guest',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text(
                            'By continuing, you agree to our',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Privacy Policy
                            },
                            child: const Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
