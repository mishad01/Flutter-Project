import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            buildBackground(),
            const Gap(68),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Gap(68),
                  buildHeader(),
                  Gap(15),
                  buildSearch(),
                  Gap(68),
                  //buildBanner(),
                  Gap(68),
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        //buildCategories()
        const Gap(20),
        //buildFridCoffee()
        const Gap(20),
      ],
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff2A2A2A)),
              height: 52,
              child: const Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_search.png'),
                    size: 20,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Search coffee',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(16),
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage('assets/images/ic_filter.png'),
              size: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            color: Color(0xffA2A2A2),
            //letterSpacing: 0.5,
          ),
        ),
        const Gap(10),
        Row(
          children: [
            const Text(
              'Bilzen, Tanjungbalai',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white
                  //letterSpacing: 0.5,
                  ),
            ),
            Gap(10),
            Image.asset('assets/images/ic_arrow_down.png',
                width: 24, height: 24),
          ],
        ),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      height: 280,
      //width: 420,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff111111),
            Color(0xff313131),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
