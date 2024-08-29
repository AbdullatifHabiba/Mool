import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/auth/country_selection_screen.dart';
import 'package:mool/screens/auth/sign_in_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import 'package:mool/widgets/auth_widgets/social_icons_widget.dart';
import '../../widgets/custom_text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String? selectedCountry;

  void _showCountrySelectionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen bottom sheet
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return CountrySelectionSheet(
          selectedCountry: selectedCountry,
          onCountrySelected: (country) {
            setState(() {
              selectedCountry = country;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

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
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Titles.createAccount,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Titles.startShopping,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
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
                      const CustomTextField(label: 'First Name'),
                      const CustomTextField(label: 'Last Name'),
                      const CustomTextField(label: 'Email'),
                      GestureDetector(
                        onTap: _showCountrySelectionSheet,
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: Titles.country,
                              hintText:
                                  selectedCountry ?? Titles.countrySelection,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomTextField(label: 'Country Code'),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 5,
                            child: CustomTextField(label: 'Mobile No.'),
                          ),
                        ],
                      ),
                      const CustomTextField(
                          label: 'Password', obscureText: true),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Sign Up
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          Titles.signUp,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(Titles.alreadyHaveAccount),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ));
                              // Handle Login
                            },
                            child: const Text(Titles.login),
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