import 'package:flutter/material.dart';
import 'package:mool/screens/create_account_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import '../widgets/custom_text_field.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              // margin: const EdgeInsets.only(top: 50),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const CustomBackArrow(),
                    const SizedBox(width: 100),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 50.0,
                      width: 100.0,
                    ),
                  ]),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(label: 'Email'),
                    const CustomTextField(label: 'Password', obscureText: true),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerRight, // Align to right
                        child: const Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Sign Up
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Sign in',
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t Have account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateAccountScreen(),
                            ));
                            // Handle Login
                          },
                          child: const Text('SignUp'),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black, // Background color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.g_mobiledata,
                                color: Colors.white), // Icon color
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black, // Background color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.apple,
                                color: Colors.white), // Icon color
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black, // Background color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.facebook,
                                color: Colors.white), // Icon color
                            onPressed: () {},
                          ),
                        ),
                      ],
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
