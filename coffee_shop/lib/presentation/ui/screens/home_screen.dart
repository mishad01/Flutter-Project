import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/controller/home_controller.dart';
import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/screens/detail_screen.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
        body: ListView(
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
                  const Gap(40),
                  buildHeader(),
                  const Gap(15),
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
        buildGridCoffee(),
        const Gap(20),
      ],
    ));
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
            buildBannerName('3'),
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
              'Dampara, Chattogram',
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

  Widget buildGridCoffee() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: listGridCoffe.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 238,
          crossAxisSpacing: 15,
          mainAxisSpacing: 24),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Coffee coffee = listGridCoffe[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailScreen(
                  coffee: coffee,
                ));
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        coffee.image,
                        height: 135,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0x111111).withOpacity(0.5),
                              Color(0x313131).withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AssetPath.icStarFilled,
                              height: 12,
                              width: 12,
                            ),
                            Gap(10),
                            Text(
                              '${coffee.rate}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  coffee.type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 2,
                        locale: 'en_US',
                        symbol: '\$',
                      ).format(coffee.price),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      //alignment: Alignment.,
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
