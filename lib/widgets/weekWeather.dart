import 'package:flutter/material.dart';

class Weekweather extends StatelessWidget {
  final String weekDay;
  final double minTemp;
  final double maxTemp;
  final String weatherType;

  const Weekweather(
      {super.key,
      required this.weekDay,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherType});

  @override
  Widget build(BuildContext context) {
    print(weatherType);
    return Row(
      children: [
        SizedBox(
          height: 45,
        ),
        Expanded(
          child: Text(
            weekDay,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Image.asset(
          "assets/cloudy.png",
          width: 50,
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: Text(
            weatherType.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
        SizedBox(
          width: 44,
        ),
        Text(
          (maxTemp).round().toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          (minTemp).round().toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }
}
