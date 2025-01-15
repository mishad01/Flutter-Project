import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/resources/export.dart';
import 'package:e_learning_app/view/home/widget/all_categories.dart';
import 'package:e_learning_app/view/home/widget/category_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      AssetsPath.school,
      AssetsPath.college,
      AssetsPath.english,
      AssetsPath.creative,
      AssetsPath.health,
      AssetsPath.life
    ];
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 3.h),
            CategoriesSection(
                type: "Categories",
                widgets: AllCategories(categories: categories)),

            Container(
              width: 86.5.w,
              height: 14.0.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Top Mentor",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        CustomText(
                          text: "SEE ALL",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.themeColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            //buildCard(),
          ],
        ),
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Container(
            width: 280,
            height: 134,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.black,
            ),
          ),
          Container(
            width: 280,
            height: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
