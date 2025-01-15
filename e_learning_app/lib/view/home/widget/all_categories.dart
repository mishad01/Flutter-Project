import 'package:e_learning_app/resources/export.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
          width: 70,
          height: 76,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SvgPicture.asset(categories[index]);
            },
          )),
    );
  }
}
