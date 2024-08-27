import 'package:flutter/material.dart';
import 'package:mool/screens/sign_in_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import '../widgets/custom_text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String? selectedCountry;

  // This is a simplified list. You might want to use a more comprehensive one.
  final List<String> countries = [
    'USA',
    'Canada',
    'UK',
    'Australia',
    'Germany',
    'France',
    'Japan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        'Create Account',
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
                        'Start shopping now',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                    const CustomTextField(label: 'First Name'),
                    const CustomTextField(label: 'Last Name'),
                    const CustomTextField(label: 'Email'),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Country',
                        fillColor:
                            Colors.white, // Set background color to white
                        filled: true, // Enable filling the background color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(
                            color: Colors.white, // Set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(
                            color: Colors.white, // Set border color to white
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(
                            color: Colors.white, // Set border color to white
                          ),
                        ),
                      ),
                      value: selectedCountry,
                      items: countries.map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      },
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
                    const CustomTextField(label: 'Password', obscureText: true),
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
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already Have account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ));
                            // Handle Login
                          },
                          child: const Text('Login'),
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
            ],
          ),
        ),
      ),
    );
  }
}
