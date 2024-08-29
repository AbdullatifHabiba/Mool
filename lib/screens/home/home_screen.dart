import 'package:flutter/material.dart';
import 'package:mool/constants/images.dart';
import 'package:mool/screens/catagrios/categories_screen.dart';
import 'package:mool/screens/home/main_home_screen.dart';
import 'package:mool/widgets/home_widgets/home_bottom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
final List<Widget> _children = [
    const MainHomeScreen(),
    CategoriesScreen(),
    const Center(child: Text('Discover Screen')),
    const Center(child: Text('Cart Screen')),
    const Center(child: Text('Profile Screen')),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: _children[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
  
 }
   
  
