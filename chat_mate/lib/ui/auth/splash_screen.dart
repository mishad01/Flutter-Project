import 'package:chat_mate/ui/auth/sign_in_screen.dart';
import 'package:chat_mate/ui/utility/assets_paths.dart';
import 'package:chat_mate/widgets/background_widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: Center(child: Image.asset(AssetsPaths.appLogo)),
      ),
    );
  }
}
