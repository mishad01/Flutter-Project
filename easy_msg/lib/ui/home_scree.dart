import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: ,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetPath.chatBg), fit: BoxFit.cover)),
      ),
    );
  }
}
