import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/theme_manager.dart';
import '/widgets/components/myBottom.dart';

class MyCalender extends StatelessWidget {
  const MyCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    // final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final fontSize = themeManager.fontSize;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: themeManager.appBarColor,
        foregroundColor: Colors.white,
        title: const Text(
          "Calander",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
        onTabTapped: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, "/homePage"); // Navigate to the home page
          } else if (index == 2) {
            Navigator.pushNamed(context, "/profile"); // Navigate to the profile page
          }
        },
      ),     
      body: Center(
              child: Text(
                "Nội dung trang tổng quan",
                style: TextStyle(
                  fontSize: fontSize,
                  
                ),
              ),
            ),
    );
  }
}
