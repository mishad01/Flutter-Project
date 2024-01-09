import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiscreen_navigation/model/mealModel.dart';
import 'package:multiscreen_navigation/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class mealIteam extends StatelessWidget {
  const mealIteam({
    super.key,
    required this.meal,
  });
  final Meal meal;

  String get ComplexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get AffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            //with this position we are making sure that this container below should be ar the bottom of the image
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 6),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow
                        .ellipsis, //If we have very long text then at the end it will ad "..."
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      MealIeamTrait(
                        icon: Icons.schedule,
                        label: '${meal.duration} min',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealIeamTrait(
                        icon: Icons.work,
                        label: ComplexityText,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealIeamTrait(
                        icon: Icons.attach_money,
                        label: AffordabilityText,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
