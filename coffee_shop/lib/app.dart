import 'package:coffee_shop/presentation/ui/screens/home_screen.dart';
import 'package:coffee_shop/presentation/ui/screens/on_boarding_screen.dart';
import 'package:coffee_shop/presentation/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeShop extends StatelessWidget {
  const CoffeeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _ThemeData(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => OnBoardingScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/navbar', page: () => MainBottomNavBar()),
      ],
    );
  }

  ThemeData _ThemeData() {
    return ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        scaffoldBackgroundColor: Color(0xffF9F9F9));
  }
}
