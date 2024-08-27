import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/create_account_screen.dart';
import 'package:mool/widgets/Custom_elevated_button.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        color: Colors.grey[900],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.5, // 50% of screen height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Images.logo,
                      height: size.height * 0.05, 
                      width: size.width * 0.25,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width , 
                        height: size.height * 0.35, //  height
                        child: Stack(
                          children: [
                            Positioned(
                              left: size.width * 0.1, 
                              child: SvgPicture.asset(
                                Images.welcome,
                                fit: BoxFit.cover,
                                width: size.width ,
                                height: size.height * 0.3, //  height
                              ),
                            ),
                            Positioned(
                              left: size.width * 0.12, 
                              top: size.height * 0.01, 
                              child: Image.asset(
                                Images.person,
                                fit: BoxFit.cover,
                                width: size.width * 0.44, 
                                height: size.height * 0.28, //  height
                              ),
                            ),
                            Positioned(
                              top: size.height * 0.01, 
                              right: size.width * 0.09, 
                              child: Image.asset(
                                Images.person,
                                fit: BoxFit.cover,
                                width: size.width * 0.44, 
                                height: size.height * 0.28, //  height
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05), 
                      child: const Text(
                        Titles.findTheBestCollection,
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
                  margin: EdgeInsets.only(top: size.height * 0.01), // 1% of screen height
                  padding: EdgeInsets.all(size.width * 0.05), // 5% of screen width for padding
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
                        Titles.getYourDreamItems,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: size.height * 0.02), // 2% of screen height
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            text: Titles.signUp,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateAccountScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: size.width * 0.05), // 5% of screen width
                          CustomElevatedButton(
                            text: Titles.signIn,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02), // 2% of screen height
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
                      SizedBox(height: size.height * 0.01), // 1% of screen height
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Text(
                              Titles.continuingAgree,
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
                                Titles.termsOfService,
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
