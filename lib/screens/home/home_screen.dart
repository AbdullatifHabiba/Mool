import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/Cart/cart_screen.dart';
import 'package:mool/screens/Discover/discover_screen.dart';
import 'package:mool/screens/catagrios/categories_screen.dart';
import 'package:mool/screens/home/main_home_screen.dart';
import 'package:mool/screens/profile/profile_screen.dart';
import 'package:mool/widgets/home_widgets/home_bottom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedTabIndex = 1; // To keep track of selected "WOMEN" or "MEN"
  Widget _currentScreen = const MainHomeScreen(); // Initial screen

  final List<Widget> _children = [
    const MainHomeScreen(),
    const CategoriesScreen(),
    const DiscoverScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    // When tapping on the bottom navigation, navigate to a new screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _children[index]),
    ).then((value) {
      // When returning from a pushed route, reset the index to 0
      setState(() {
        _currentIndex = 0;
      });
    });
  }

  void _onGenderTabTapped(int index) {
    // Replace the current content with the selected gender category
    setState(() {
      _selectedTabIndex = index;
      _currentScreen = index == 0
          ? const Center(child: Text('WOMEN Category Screen'))
          : const MainHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Adjust height to fit both lines
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color(0xFF292D32),
              automaticallyImplyLeading: false,
              title: Image.asset(Images.logo, height: 50),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              color: const Color(0xFF292D32), // Same background as the AppBar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderTab('WOMEN', 0),
                  _buildGenderTab('MEN', 1),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _currentScreen,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  Widget _buildGenderTab(String label, int index) {
    return GestureDetector(
      onTap: () => _onGenderTabTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: _selectedTabIndex == index ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (_selectedTabIndex == index)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 40,
                color: Colors.white, // Indicator color
              ),
          ],
        ),
      ),
    );
  }
}
