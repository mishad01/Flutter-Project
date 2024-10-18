import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/presentation/utils/assets_path.dart';
import 'package:weather_app/presentation/widgets/bottom_container.dart';
import 'package:weather_app/presentation/widgets/positioned_text.dart';

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
          PositionedText(
              text: "Chattogram",
              top: 100,
              style: GoogleFonts.poppins(fontSize: 34)),
          PositionedText(
            text: "19°",
            top: 120,
            style:
                GoogleFonts.poppins(fontSize: 96, fontWeight: FontWeight.w100),
          ),
          PositionedText(
              text: "Mostly Clear",
              top: 230,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color(0xffEBEBF5),
                  fontWeight: FontWeight.w500)),
          PositionedText(
              text: "H:24°   L:18°",
              top: 260,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          _house(),
          _bottomContainer(),
          _bottomAppBar(),
        ],
      ),
    );
  }

  Widget _bottomAppBar() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: SvgPicture.asset(
        AssetsPath.bottomAppBar,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _bottomContainer() {
    return const Align(
        alignment: FractionalOffset.bottomCenter, child: BottomContainer());
  }

  Widget _house() {
    return Positioned(
      bottom: 160,
      child: SizedBox(
        width: 400,
        child: Center(
          child: SvgPicture.asset(
            AssetsPath.house,
            fit: BoxFit.fill,
            width: 400,
          ),
        ),
      ),
    );
  }
}
