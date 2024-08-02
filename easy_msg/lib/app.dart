import 'package:easy_msg/ui/auth/sign_in_screen.dart';
import 'package:easy_msg/ui/auth/sign_up_screen.dart';
import 'package:easy_msg/ui/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EasyMsg extends StatelessWidget {
  const EasyMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/signIn', page: () => SignInScreen()),
        GetPage(name: '/signUp', page: () => SignUpScreen())
      ],
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
