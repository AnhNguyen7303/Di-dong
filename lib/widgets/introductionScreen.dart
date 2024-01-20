import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '/models/theme_manager.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: themeManager.appBarColor,
        foregroundColor: Colors.white,
        title: Text(
          "Giới thiệu ứng dụng",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/user2.png'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Nguyễn Đức Anh', CupertinoIcons.person, isDarkMode),
            const SizedBox(height: 10),
            itemProfile('Phone', '0981402765', CupertinoIcons.phone, isDarkMode),
            const SizedBox(height: 10),
            itemProfile('Address', 'Hà Đông', CupertinoIcons.location, isDarkMode),
            const SizedBox(height: 10),
            itemProfile('Email', '21012478@st.phenikaa-uni.edu.vn', CupertinoIcons.mail, isDarkMode),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData, bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: isDarkMode
                ? Colors.black.withOpacity(0.3)
                : const Color.fromARGB(255, 173, 167, 165).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isDarkMode ? Colors.grey : Colors.black87),
        ),
        leading: Icon(iconData, color: isDarkMode ? Colors.grey : Colors.black),
        trailing: Icon(Icons.arrow_forward, color: isDarkMode ? Colors.grey.shade400 : Colors.black54),
        tileColor: isDarkMode ? Colors.grey[900] : Colors.white,
      ),
    );
  }
}


