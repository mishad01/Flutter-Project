import 'package:easy_msg/ui/auth_screen/sign_in_screen.dart';
import 'package:easy_msg/ui/auth_screen/sign_up_screen.dart';
import 'package:easy_msg/ui/auth_screen/splash_screen.dart';
import 'package:easy_msg/ui/chat_screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyMsg extends StatelessWidget {
  const EasyMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: AuthStateHandler(), //
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/signIn', page: () => const SignInScreen()),
        GetPage(name: '/signUp', page: () => const SignUpScreen()),
        GetPage(name: '/chatScreen', page: () => const ChatScreen())
      ],
      theme: buildThemeData(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 63, 17, 177),
      ),
    );
  }
}

/*class AuthStateHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen(); // Show a loading indicator while waiting for authentication state
        }
        if (snapshot.hasData) {
          return ChatScreen();
        } else {
          return SignInScreen(); // Navigate to SignInScreen if the user is not authenticated
        }
      },
    );
  }
}*/
