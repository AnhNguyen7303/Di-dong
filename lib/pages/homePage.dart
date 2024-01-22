import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/homePage/mainFeatures.dart';
import '../widgets/homePage/nearbyEmployee.dart';
import '../widgets/homePage/upcoming_card.dart';
import '/widgets/components/myBottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Đức Anh"),
            Text(
              "Hôm nay bạn cảm thấy thế nào?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.search_outline),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(14),
            children: [
              const UpcomingCard(),
              const SizedBox(height: 20),
              Text(
                "Main feature",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15),
              const HealthNeeds(),
              const SizedBox(height: 25),
              Text(
                "Recently",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15),
              const NearbyEmployee(),
            ],
          ),
          // Add other pages for Notifications, Messages, etc.
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
        onTabTapped: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, "/newpage"); // Navigate to the home page
          } else if (index == 2) {
            Navigator.pushNamed(context, "/profile"); // Navigate to the profile page
          }
        },
      ), 
    );
  }
}

