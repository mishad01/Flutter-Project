import 'package:easy_msg/ui/controller/bottom_nav_bar_controller.dart';
import 'package:easy_msg/ui/screens/chat_screen.dart';
import 'package:easy_msg/ui/screens/detail_screen_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final BottomNavBarController _navBarController =
      Get.find<BottomNavBarController>();

  List<Widget> _screens = [
    /*HomeScree(),*/
    ChatScreen(),
    DetailsScreenBack(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          items: const [
            /*BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),*/
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Details'),
          ],
          type: BottomNavigationBarType
              .fixed, // or BottomNavigationBarType.shifting
          iconSize: 20, // Adjust icon size
          selectedFontSize: 12, // Adjust selected label font size
          unselectedFontSize: 10, // Adjust unselected label font size
          selectedItemColor: Colors.blue, // Customize selected item color
          unselectedItemColor: Colors.grey, // Customize unselected item color
        ),
        body: _screens[_navBarController.selectedIndex],
      );
    });
  }
}
