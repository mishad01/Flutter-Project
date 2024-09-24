import 'package:coffee_shop/presentation/ui/screens/favourtie_screen.dart';
import 'package:coffee_shop/presentation/ui/screens/home_screen.dart';
import 'package:coffee_shop/presentation/ui/screens/order_screen.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
  /*List<Widget> _screen = [
    HomeScreen(),
    FavourtieScreen(),
    FavourtieScreen(),
    FavourtieScreen(),
  ];*/
  final menu = [
    {
      'icon': 'assets/images/ic_home_border.png',
      'icon_active': 'assets/images/ic_home_filled.png',
      'fragment': const HomeScreen(),
    },
    {
      'icon': 'assets/images/ic_heart_border.png',
      'icon_active': 'assets/images/ic_heart_border.png',
      'fragment': FavouriteScreen(),
    },
    {
      'icon': 'assets/images/ic_bag_border.png',
      'icon_active': 'assets/images/ic_bag_border.png',
      'fragment': OrderScreen(),
    },
    {
      'icon': 'assets/images/ic_notification_border.png',
      'icon_active': 'assets/images/ic_notification_border.png',
      'fragment': const Center(child: Text('No Notification yet')),
    },
  ];

  get indexMenu => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            if (mounted) setState(() {});
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
        ),
      ),*/
        body: menu[_selectedIndex]['fragment'] as Widget,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          //height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              menu.length,
              (index) {
                Map item = menu[index];
                bool isActive = _selectedIndex == index;

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectedIndex = index;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(16),
                          ImageIcon(
                            AssetImage(
                              item[isActive ? 'icon_active' : 'icon'],
                            ),
                            size: 24,
                            color: Color(isActive ? 0xffC67C43 : 0xffA2A2A2),
                          ),
                          if (isActive) const Gap(6),
                          if (isActive)
                            Container(
                              height: 5,
                              width: 10,
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
        //body: _screen[_selectedIndex],
        );
  }
}
