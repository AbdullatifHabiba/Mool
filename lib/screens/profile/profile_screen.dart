import 'package:flutter/material.dart';
import 'package:mool/screens/country_selection_screen.dart';
import 'package:mool/screens/home/home_screen.dart';
import 'package:mool/screens/home/my_list_screen.dart';
import 'package:mool/widgets/custom_back_arrow.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  Map<String, String> _selectedCountry = {'name': 'Saudi Arabia', 'flag': '🇸🇦'};

  void _updateSelectedCountry(Map<String, String> country) {
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        leading: CustomBackArrow(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildAccountOption(context, 'Your Account', Icons.person_outline),
          buildAccountOption(context, 'Your Orders', Icons.shopping_bag_outlined),
          buildAccountOption(context, 'My Favorite', Icons.favorite_border),
          buildAccountOption(context, 'Address Book', Icons.location_on_outlined),
          buildAccountOption(context, 'Change Password', Icons.lock_outline),
          buildAccountOption(context, 'Language', Icons.language_outlined),
          buildAccountOption(context, 'Country', Icons.public_outlined, true),
          buildAccountOption(context, 'About Us', Icons.info_outline),
          buildAccountOption(context, 'Contact Us', Icons.contact_mail_outlined),
          buildAccountOption(context, 'Logout', Icons.logout),
        ],
      ),
    );
  }

  Widget buildAccountOption(BuildContext context, String title, IconData icon, [bool hasBadge = false]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(title),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        trailing: hasBadge
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_selectedCountry['flag']!),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.black54),
                ],
              )
            : const Icon(Icons.chevron_right, color: Colors.black54),
        onTap: () {
          if (title == 'Country') {
            showModalBottomSheet(
              context: context,
              builder: (context) => CountrySelectionSheet(
                selectedCountry: _selectedCountry['name'],
                onCountrySelected: (country) {
                  if (country != null) {
                    _updateSelectedCountry(country);
                  }
                   Navigator.pop(context);
                },
              ),
            );
          } else if (title == 'Logout') {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          } else if (title == 'My Favorite') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MyListItemsScreen()),
            );
          }
        },
      ),
    );
  }
}