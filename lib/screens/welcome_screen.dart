import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/auth/create_account_screen.dart';
import 'package:mool/widgets/Custom_elevated_button.dart';
import 'auth/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.08),
            const Text(
              'MOOL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Images.welcome,
                  width: size.width * 0.8,
                  height: size.height * 0.3,
                ),
                //   Positioned(
                //     right: size.width * 0.15,
                //     child: ClipOval(
                //       child: Image.asset(
                //         Images.person,
                //         width: size.width * 0.2,
                //         height: size.width * 0.35,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   Positioned(
                //     left: size.width * 0.15,
                //     child: ClipOval(
                //       child: Image.asset(
                //         Images.person,
                //         width: size.width * 0.2,
                //         height: size.width * 0.35,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              Titles.findTheBestCollection,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.03),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Titles.getYourDreamItems,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: 'Sign Up',
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountScreen()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: 
                          CustomElevatedButton(
                            text: 'Sign In',
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton(
                      onPressed: () {
                        // Handle Continue as Guest
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Continue as ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'guest',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            Titles.continuingAgree,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Terms of Service
                            },
                            child: const Text(
                              Titles.termsOfService,
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontSize: 12,
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