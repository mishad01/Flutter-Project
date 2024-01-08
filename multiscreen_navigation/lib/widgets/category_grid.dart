import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiscreen_navigation/model/categories_Model.dart';

class categoryGridItem extends StatelessWidget {
  const categoryGridItem({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            // SizedBox(
            //   height: 10.h,
            // )
            Icon(
              category.icon,
              size: 40,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }
}
