import 'package:flutter/material.dart';
import 'package:sekai_news/screens/bottom_nav_bar/bottom_navigation_bar/main_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white54,
      theme: ThemeData(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(elevation: 0,backgroundColor: Colors.white,type: BottomNavigationBarType.shifting,unselectedItemColor: Colors.grey,landscapeLayout: BottomNavigationBarLandscapeLayout.centered,showSelectedLabels: false,selectedIconTheme: IconThemeData(size: 50)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent,foregroundColor: Colors.black,elevation: 0,centerTitle: true,),
      ),
      home: const MainNavScreen(),
    );
  }
}
