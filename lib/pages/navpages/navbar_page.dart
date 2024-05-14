import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/pages/navpages/bookmarks_page.dart';
import 'package:pmob_petakgov/pages/navpages/home_page.dart';
import 'package:pmob_petakgov/pages/navpages/my_page.dart';
import 'package:pmob_petakgov/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    BookmarksPage(),
    SearchPage(),
    const mypage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor.withOpacity(0.2),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black26,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          const BottomNavigationBarItem(label: "See", icon: Icon(Icons.star)),
          const BottomNavigationBarItem(
              label: "Search", icon: Icon(Icons.search)),
          const BottomNavigationBarItem(
              label: "Support", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
