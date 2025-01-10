import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/resources/export.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Hi, ALEX",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Text(
              "What Would you like to learn Today? \nSearch Below",
              style: GoogleFonts.mulish(
                color: AppColors.blackGray,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 3.h),
          CarouselSlider(
            options: CarouselOptions(height: 180.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(22)),
                      child: Image.asset(AssetsPath.sliderCard));
                },
              );
            }).toList(),
          ),
          Container()
        ],
      ),
    );
  }
}
