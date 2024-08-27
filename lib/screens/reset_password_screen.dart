import 'package:flutter/material.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import 'package:mool/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: const CustomBackArrow(),
        title: const Center(
          child: Text(
                 Titles.resetPassword,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
              
      ),
      body: Padding(
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
               style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                ),
              onPressed: () {
                // Handle Password Reset
              },
              child: const Text('Reset Password', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
