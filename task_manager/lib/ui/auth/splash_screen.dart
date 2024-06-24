import 'package:flutter/material.dart';
import 'package:task_manager/ui/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/assets.path.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    }
  }

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
