import 'package:flutter/material.dart';

class Weekweather extends StatelessWidget {
  final String weekDay;

  const Weekweather({super.key, required this.weekDay});

  @override
  Widget build(BuildContext context) {
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
          width: 67,
        ),
        Image.asset(
          "assets/cloudy.png",
          width: 50,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "Sunny",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
        ),
        SizedBox(
          width: 44,
        ),
        Text(
          "+31",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "+25",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }
}
