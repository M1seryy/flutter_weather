import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final String cityName;
  final String conditions;
  const CityWidget(
      {super.key, required this.cityName, required this.conditions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 34),
      margin: EdgeInsets.only(top: 44),
      width: 320,
      height: 90,
      decoration: BoxDecoration(
          color: Color.fromARGB(40, 239, 239, 239),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                conditions,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Image.asset(
            "assets/cloudy.png",
            width: 145,
            height: 114,
          ),
        ],
      ),
    );
  }
}
