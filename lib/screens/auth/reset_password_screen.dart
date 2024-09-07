import 'package:flutter/material.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/widgets/custom_text_field.dart';
import 'package:mool/widgets/custum_app_bar.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: Titles.resetPassword),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextField(label: 'New Password'),
                    const SizedBox(height: 20),
                    const CustomTextField(label: 'Confirm Password'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(Titles.submit, style: TextStyle(color: Colors.white)),
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