import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);
  final int currentIndex;
  final ValueChanged<int>onTap;


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: widget.onTap,currentIndex: widget.currentIndex,elevation: 0,items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.globe),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.sportscourt),label: 'Sports'),
        BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded),label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Technology'),
    ]);
  }
}
