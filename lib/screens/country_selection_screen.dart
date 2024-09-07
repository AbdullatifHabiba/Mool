import 'package:flutter/material.dart';
import 'package:mool/widgets/custom_radio_button.dart';

class CountrySelectionSheet extends StatefulWidget {
  final String? selectedCountry;
  final ValueChanged<Map<String,String>?> onCountrySelected;
  final bool seeContinueButton;

  const CountrySelectionSheet({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
    this.seeContinueButton = true,

  });

  @override
  // ignore: library_private_types_in_public_api
  _CountrySelectionSheetState createState() => _CountrySelectionSheetState();
}

class _CountrySelectionSheetState extends State<CountrySelectionSheet> {
  late String? _selectedCountry;
  bool _seeContinueButton = false;



  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.selectedCountry;
    _seeContinueButton = widget.seeContinueButton;

  }

  void _selectCountry(Map<String,String>? country) {
    setState(() {
      _selectedCountry = country!['name'];
    });
    widget.onCountrySelected(country);
  }

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
                  groupValue: _selectedCountry,
                  onChanged: _selectCountry,
                ),
                CustomRadioButton(
                  title: '🇦🇪 United Arab Emirates',
                  value: 'United Arab Emirates',
                  groupValue: _selectedCountry,
                  onChanged: _selectCountry,
                ),
                CustomRadioButton(
                  title: '🇪🇬 Egypt',
                  value: 'Egypt',
                  groupValue: _selectedCountry,
                  onChanged: _selectCountry,
                ),
                // Add more countries as needed
              ],
            ),
          ),
          // see only if pop up in create account screen
          if (_seeContinueButton)
          ElevatedButton(
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