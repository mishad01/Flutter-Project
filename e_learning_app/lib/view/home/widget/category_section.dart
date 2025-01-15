import 'package:e_learning_app/resources/export.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.type,
    required this.widgets,
  });
  final String type;
  final Widget widgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  text: type,
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
          widgets,
        ],
      ),
    );
  }
}
