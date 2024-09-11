import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/controller/home_controller.dart';
import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCofferTEController = TextEditingController();
  String categoriesSelected = 'All Coffee';
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Gap(40),
                  buildHeader(),
                  Gap(15),
                  buildSearch(),
                  //Gap(),
                  buildBanner(),
                ],
              ),
            ),
          ],
        ),
        //const Gap(20),
        buildCategories(),
        const Gap(20),
        buildFridCoffee(),
        const Gap(20),
      ],
    );
  }

  /*Widget buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AssetPath.banner1,
        width: double.infinity,
        height: 140,
        scale: 2,
        fit: BoxFit.values[1],
      ),
    );
  }*/
  Widget buildBannerName(String value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/banner$value.png',
        width: double.infinity,
        height: 140,
        fit: BoxFit.values[1],
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      'All Coffee',
      'Machiato',
      'Latte',
      'Americano',
    ];
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isActive = categoriesSelected == category;
          return GestureDetector(
            onTap: () {
              categoriesSelected = category;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: index == 0 ? 24 : 8,
                  right: index == categories.length - 1 ? 24 : 8),
              decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.themeColor
                      : Colors.white38.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(6)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w600,
                    fontSize: 14,
                    color: isActive ? Colors.white : Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBanner() {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: [
            buildBannerName('1'),
            buildBannerName('5'),
            buildBannerName(''),
            buildBannerName('4'),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.updatePageIndicator(index),
          ),
        ),
        //SizedBox(height: 10),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 7,
                  width: 20,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: controller.carousalCurrentIndex.value == i
                        ? AppColors.themeColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                )
            ],
          ),
        ),
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
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_search.png'),
                    size: 20,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchCofferTEController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          hintText: 'Search coffee',
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 14)),
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

  Widget buildFridCoffee() {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Coffee coffee = ListGridCoffe[index];
        },
      ),
    );
  }
}
