import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/Cart/cart_screen.dart';
import 'package:mool/screens/Discover/discover_screen.dart';
import 'package:mool/screens/catagrios/categories_screen.dart';
import 'package:mool/screens/home/main_home_screen.dart';
import 'package:mool/screens/notification_screen.dart';
import 'package:mool/screens/profile/profile_screen.dart';
import 'package:mool/widgets/home_widgets/home_bottom_widget.dart';
import 'package:mool/widgets/home_widgets/search_cutom_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedTabIndex = 1; // To keep track of selected "WOMEN" or "MEN"

  late final List<Widget> _children;
  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();

    _children = [
      MainHomeScreen(
        buildGenderTab: _buildGenderTab,
      ),
      const CategoriesScreen(),
      const DiscoverScreen(),
      const CartScreen(),
      const MyAccountScreen(),
    ];

    _currentScreen = _children[_currentIndex];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentScreen = _children[index];
    });
  }

  void _onGenderTabTapped(int index) {
    // Replace the current content with the selected gender category
    setState(() {
      _selectedTabIndex = index;
      _currentScreen = index == 0
          ? const Center(child: Text('WOMEN Category Screen'))
          : MainHomeScreen(
              buildGenderTab: _buildGenderTab,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _currentIndex==0?
         PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color(0xFF292D32),
              automaticallyImplyLeading: false,
              title: Image.asset(Images.logo, height: 50),
              actions: [
                const ExpandableSearchBar(),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Handle notification tap
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()));
                  },
                ),
              ],
            ),
            Container(
              color: const Color(0xFF292D32),
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
      ):null,
    
            body: Stack(
        children: [
          _currentScreen, // Your main screen content
          if (_currentIndex != 2)
         CustomBottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
              ),
            
        ],
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