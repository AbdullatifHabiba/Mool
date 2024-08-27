import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomRadioButton(
                  title: '🇸🇦 Saudi Arabia',
                  value: 'Saudi Arabia',
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                CustomRadioButton(
                  title: '🇦🇪 United Arab Emirates',
                  value: 'United Arab Emirates',
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                CustomRadioButton(
                  title: '🇪🇬 Egypt',
                  value: 'Egypt',
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.all(16),
              minimumSize: const Size(200, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              );
            },
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: groupValue == value
                    ? Colors.black
                    : Colors.transparent, // Background color
                border: Border.all(
                  color: groupValue == value ? Colors.black : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: groupValue == value
                  ? const Icon(
                      Icons.check,
                      size: 20.0,
                      color: Colors.white, // Check mark color
                    )
                  : const SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
