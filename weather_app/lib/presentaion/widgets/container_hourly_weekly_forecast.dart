import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerHourlyWeeklyForecast extends StatefulWidget {
  const ContainerHourlyWeeklyForecast({super.key});

  @override
  State<ContainerHourlyWeeklyForecast> createState() =>
      _ContainerHourlyWeeklyForecastState();
}

class _ContainerHourlyWeeklyForecastState
    extends State<ContainerHourlyWeeklyForecast> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(44),
            topLeft: Radius.circular(44),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 15.0),
            child: Container(
              color: Colors.white.withOpacity(0.10),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 48,
                height: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hourly Forecast",
                  style: TextStyle(
                      color: Color(0xffEBEBF5).withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Weekly Forecast",
                  style: TextStyle(
                      color: Color(0xffEBEBF5).withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 146,
                width:
                    double.infinity, // Change to double.infinity for full width
                child: _buildListView(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics:
          BouncingScrollPhysics(), // Use ClampingScrollPhysics for Android-like scroll
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: 146,
              width: 75,
              margin: EdgeInsets.symmetric(
                  horizontal: 4), // Adds spacing between items
              decoration: BoxDecoration(
                color: Colors
                    .transparent, // Optional: Set a background color if needed
              ),
              child: SvgPicture.asset(
                "assets/images/Hour.svg",
                height: 146, // Adjust height if needed
                width: 60, // Adjust width if needed
                fit: BoxFit
                    .cover, // Adjust how the image should fit in the container
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text("12 PM",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
