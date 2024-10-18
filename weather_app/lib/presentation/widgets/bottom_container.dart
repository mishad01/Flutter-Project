import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/container_hourly_weekly_forecast.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: 325,
          decoration: BoxDecoration(
              /*gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff3A3A6A).withOpacity(0.70),
                Color(0xff483190).withOpacity(0.70),
                Color(0xffC427FB).withOpacity(0.1),
                Color(0xff7582F4).withOpacity(0.5),
                Color(0xffE0D9FF), // Fully opaque
              ],
            ),*/
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(44),
                topLeft: Radius.circular(44),
              ),
              border: Border(top: BorderSide(color: Colors.white))),
          child: ContainerHourlyWeeklyForecast(),
        ),
      ],
    );
  }
}
