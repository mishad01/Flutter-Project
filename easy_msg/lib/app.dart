import 'package:easy_msg/controller_binder.dart';
import 'package:easy_msg/ui/screens/auth_screen/sign_in.dart';
import 'package:easy_msg/ui/screens/auth_screen/sign_up.dart';
import 'package:easy_msg/ui/screens/auth_screen/splash_screen.dart';
import 'package:easy_msg/ui/screens/chat_screen.dart';
import 'package:easy_msg/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyMsg extends StatelessWidget {
  const EasyMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthStateHandler(), //
      initialRoute: '/',
      initialBinding: ControllerBinder(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/1', page: () => const SignIn()),
        GetPage(name: '/2', page: () => const SignUp()),
        GetPage(name: '/5', page: () => const ChatScreen()),
        GetPage(name: '/mainNav', page: () => const MainBottomNavBarScreen()),
      ],

      theme: buildThemeData(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color(0xffF8F9FF),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.all(
                Radius.circular(10)), // Change color and width as needed
          ),
          hintStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 63, 17, 177),
        ),
        textTheme: GoogleFonts.poppinsTextTheme());
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
