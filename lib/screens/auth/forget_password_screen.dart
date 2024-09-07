import 'package:flutter/material.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/auth/verify_screen.dart';
import 'package:mool/widgets/custom_text_field.dart';
import 'package:mool/widgets/custum_app_bar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: Titles.forgotPassword),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const CustomTextField(label: 'Email or Mobile Number'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerificationScreen(),
                          ),
                        );
                      },
                      child: const Text(Titles.submit),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}