import 'package:flutter/material.dart';
import 'package:sekai_news/screens/bottom_nav_bar/bottom_navigation_bar/bottom_nav.dart';
import 'package:sekai_news/screens/main_screens/business.dart';
import 'package:sekai_news/screens/main_screens/home.dart';
import 'package:sekai_news/screens/main_screens/sports.dart';
import 'package:sekai_news/screens/main_screens/tech.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({Key? key}) : super(key: key);

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  void _onTap(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  final List<Widget>_screens=[
    const HomeScreen(),
    const SportsScreen(),
    const BusinessScreen(),
    const TechScreen()
    //TechScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_screens[_currentIndex],
      bottomNavigationBar:  BottomNavBar(currentIndex: _currentIndex,onTap: _onTap),
    );
  }
}
