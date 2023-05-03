import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/activity/activity_screen.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/home/home_screen.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/post/upload_post_screen.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/profile/profile_screen.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/search/search_screen.dart';
import '../../../../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
   pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index){
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: backGroundColor,
        currentIndex: _currentIndex,
        inactiveColor: primaryColor,
        activeColor: blueColor,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: ""),

        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children:const[
          HomeScreen(),
          SearchScreen(),
          UploadPostScreen(),
          ActivityScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
