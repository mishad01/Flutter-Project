import 'package:bmi_calculator_app/ui/screens/calculator_screen.dart';
import 'package:bmi_calculator_app/ui/utility/app_colors.dart';
import 'package:bmi_calculator_app/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 296,
              height: 251,
              child: SvgPicture.asset(AssetPath.splashLogo),
            ),
            const SizedBox(height: 60),
            Container(
              width: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get Started with ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                  ),
                  Text(
                    "Tracking Your Health!",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const Text(
                      "Calculate your BMI and stay on top of your wellness journey, effortlessly.",
                      style:
                          TextStyle(color: Color(0xffC6C3F9), fontSize: 15.33))
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => CalculatorScreen());
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(63),
                    ),
                    minimumSize: const Size(double.maxFinite, 73)),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 17.6),
                )),
          ],
        ),
      ),
    );
  }
}
