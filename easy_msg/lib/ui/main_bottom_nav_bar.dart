import 'package:easy_msg/ui/auth_screen/backup_auth/sign_in.dart';
import 'package:easy_msg/ui/chat_screens/chat_screen.dart';
import 'package:easy_msg/ui/controller/bottom_nav_bar_controller.dart';
import 'package:easy_msg/ui/details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    ChatScreen(),
    DetailsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          title: const Text('Easy Message'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.off(() =>
                    SignIn()); // Ensure to navigate back to SignInScreen after logout
              },
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navBarController.selectedIndex,
          onDestinationSelected: _navBarController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Categories'),
          ],
        ),
        body: _screens[_navBarController.selectedIndex],
      );
    });
  }
}
