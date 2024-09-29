import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/service/weatherService.dart';
import 'package:weather_app/widgets/cityWidget.dart';

class Citysearch extends StatefulWidget {
  const Citysearch({super.key});

  @override
  State<Citysearch> createState() => _CitysearchState();
}

class _CitysearchState extends State<Citysearch> {
  final _searchController = TextEditingController();
  Weather? _weatherInCity;
  List<Weather> _cityAraay = [
    // {
    //   "cityName": "Kyiv",
    //   "temp": 25,
    //   "conditions": "Sunny",
    //   "humidity": 87,
    //   "wind_speed": 20,
    // },
    // {
    //   "cityName": "London",
    //   "temp": 85,
    //   "conditions": "Rainy",
    //   "humidity": 87,
    //   "wind_speed": 20,
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for city'),
        backgroundColor: const Color.fromARGB(255, 38, 86, 141),
      ),
      backgroundColor: HexColor("#352163FF"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(40, 239, 239, 239),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.location_on_rounded),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Add a new city",
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final response =
                      await Weatherservice().getWeather(_searchController.text);
                  setState(() {
                    _cityAraay.add(response);
                  });

                  // print(response.cityName);
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _cityAraay.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CityWidget(
                        cityName: _cityAraay[index].cityName,
                        conditions: _cityAraay[index].conditions,
                      );
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
