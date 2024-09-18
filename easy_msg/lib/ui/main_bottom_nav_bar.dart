import 'package:easy_msg/ui/chat_screens/chat_screen.dart';
import 'package:easy_msg/ui/controller/bottom_nav_bar_controller.dart';
import 'package:easy_msg/ui/details_screen.dart';
import 'package:easy_msg/ui/home_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  final BottomNavBarController _navBarController =
      Get.find<BottomNavBarController>();

  List<Widget> _screens = [
    HomeScree(),
    ChatScreen(),
    DetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
