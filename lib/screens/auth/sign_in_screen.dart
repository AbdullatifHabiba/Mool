import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/auth/create_account_screen.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import 'package:mool/widgets/auth_widgets/social_icons_widget.dart';
import '../../widgets/custom_text_field.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: const CustomBackArrow(),
                title: Center(
                  child: Image.asset(
                    Images.logo,
                    height: 50,
                  ),
                ),
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                  title: 
                  Text(
                    '${Titles.signIn} \n${Titles.welcome}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(label: 'Email'),
                      const CustomTextField(
                          label: 'Password', obscureText: true),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                        },
                        child: const Text(
                          'Sign in',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t Have account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAccountScreen(),
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
                      const SocialIconsWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
