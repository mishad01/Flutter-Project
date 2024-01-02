import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:multiscreen_and_navigation_prac/model/mealModel.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //Clip behavior ensures that any kind of content that goes outside of the shape simply cutt off
      clipBehavior: Clip.hardEdge,
      //It gives kinda elevation 3d effect
      elevation: 2,
      child: InkWell(
        onTap: () {},
        //Stack is where multiple widget are positioned on top of each other along the Z-Axis
        //Also we are using using so that as an exaple if there is an image then we can write one top of it
        child: Stack(
          children: [
            //MemoryImage is a image proivder class,which knows how to load images from memory
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              //it makes sure that the image is never distorted but instead cut off and zoomed in a bit
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      // Passing Data to the Target Screen
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
