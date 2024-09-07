import 'package:coffee_shop/presentation/ui/screens/detail_screen.dart';
import 'package:coffee_shop/presentation/ui/screens/home_screen.dart';
import 'package:coffee_shop/presentation/ui/screens/order_screen.dart';
import 'package:coffee_shop/presentation/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeShop extends StatelessWidget {
  const CoffeeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: OnBoardingScreen(),
      theme: _ThemeData(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainBottomNavBar()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/detail', page: () => DetailScreen()),
        GetPage(name: '/order', page: () => OrderScreen()),
      ],
    );
  }

  ThemeData _ThemeData() {
    return ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        scaffoldBackgroundColor: Color(0xffF9F9F9));
  }
}
