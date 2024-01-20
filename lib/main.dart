import 'package:flutter/material.dart';
import 'package:home/widgets/Login/get_started_screen.dart';
import 'package:home/widgets/Login/position_manage.dart';
import 'package:provider/provider.dart';
import '/models/theme_manager.dart';
import '/widgets/settings.dart';
import 'widgets/Employ.dart';
import 'widgets/introductionScreen.dart';
import 'pages/Calendar.dart';
import 'pages/profileAccount.dart';
import 'pages/homePage.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeManager.themeMode,
      // home: MyHomePage(),
      initialRoute: "/",
        routes: {
          "/": (context) => const GetStartedScreen(),
          "/homePage": (context) => const HomePage(),
          "/introductionScreen": (context) => const IntroductionScreen(),
          "/settings": (context) => SettingsPage(),
          "/profile": (context) => const ProfileScreen(),
          "/newpage": (context) => MyCalender(),
          "/employee": (context) => Employee(),
          "/position": (context) => PositionManage(),
        }
    );
  }
}

