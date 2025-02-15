import 'package:e_learning_app/resources/export.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = [
    AssetsPath.school,
    AssetsPath.college,
    AssetsPath.english,
    AssetsPath.creative,
    AssetsPath.health,
    AssetsPath.life,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            children: [
              _buildCarouselSlider(),
              SizedBox(height: 3.h),
              CategoriesSection(
                widgets: AllCategories(categoriesList: categories),
              ),
              SizedBox(height: 1.h),
              const PopularCategories(),
              SizedBox(height: 1.h),
              const TopMentorSection(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: List.generate(5, (index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Image.asset(AssetsPath.sliderCard),
            );
          },
        );
      }),
    );
  }
}
