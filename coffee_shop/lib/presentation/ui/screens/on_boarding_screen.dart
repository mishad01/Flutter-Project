import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.topCenter, // Aligns the image to the top
            padding: EdgeInsets.only(bottom: 60), // Adjust this value as needed
            child: Image.asset(
              AssetPath.bg2,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xff050505),
                    Color(0xff050505),
                    Color(0xff050505),
                    Color(0xff050505),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      //letterSpacing: 0.5,
                    ),
                  ),
                  const Gap(50),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/navbar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(327, 56),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
