import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, required this.currentIndex, required this.onTabTapped}) : super(key: key);

  final int currentIndex;
  final Function(int) onTabTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home_outline),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.calendar_outline),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
