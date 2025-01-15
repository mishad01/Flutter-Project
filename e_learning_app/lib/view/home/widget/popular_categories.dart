import 'package:e_learning_app/resources/export.dart';

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
