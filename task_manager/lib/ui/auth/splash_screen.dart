import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/assets.path.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Center(
          child: Image.asset(
            AssetPaths.logo,
          ),
        ),
      ),
    );
  }
}
