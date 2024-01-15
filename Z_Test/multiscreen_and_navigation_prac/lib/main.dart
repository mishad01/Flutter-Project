import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiscreen_and_navigation_prac/Screens/categories.dart';
import 'package:multiscreen_and_navigation_prac/Screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen(),
    );
  }
}
