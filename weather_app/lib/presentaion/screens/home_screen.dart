import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/presentaion/utils/assets_path.dart';
import 'package:weather_app/presentaion/widgets/background_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsPath.background,
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 160,
            child: SizedBox(
              width: 420,
              child: Center(
                child: SvgPicture.asset(
                  AssetsPath.house,
                  fit: BoxFit.fill,
                  width: 420,
                ),
              ),
            ),
          ),
          const Align(
              alignment: FractionalOffset.bottomCenter,
              child: BackgroundContainer()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SvgPicture.asset(
              AssetsPath.bottomAppBar,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
