import 'package:flutter/material.dart';
import 'package:mool/widgets/custom_radio_button.dart';
class CountrySelectionSheet extends StatelessWidget {
  final String? selectedCountry;
  final ValueChanged<String?> onCountrySelected;

  const CountrySelectionSheet({super.key, 
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.5, // Adjust the height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Select Country',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                CustomRadioButton(
                  title: '🇸🇦 Saudi Arabia',
                  value: 'Saudi Arabia',
                  groupValue: selectedCountry,
                  onChanged: onCountrySelected,
                ),
                CustomRadioButton(
                  title: '🇦🇪 United Arab Emirates',
                  value: 'United Arab Emirates',
                  groupValue: selectedCountry,
                  onChanged: onCountrySelected,
                ),
                CustomRadioButton(
                  title: '🇪🇬 Egypt',
                  value: 'Egypt',
                  groupValue: selectedCountry,
                  onChanged: onCountrySelected,
                ),
                // Add more countries as needed
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.all(16),
              minimumSize: const Size(200, 50),
            ),
            onPressed: () {
              Navigator.pop(context);
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

