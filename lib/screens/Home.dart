import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/dayWeather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/CitySearch.dart';
import 'package:weather_app/service/weatherService.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weatherService =
      Weatherservice(api_key: "35eb3d4fe816cd13a92a10c20fb6258b");
  Weather? _weather;
  Dayweather? _weatherList;

  _getDayWeather() async {
    try {
      final weatherList = await _weatherService.getWeatherByDays("kyiv");
      print(weatherList.dayForecast[0]['main']['temp']);
      print(_weatherList?.dayForecast);
      // print(weatherList.message);
      setState(() {
        _weatherList = weatherList;
      });
    } catch (e) {
      print(e);
    }
  }

  _fetchWeather() async {
    try {
      final weather = await _weatherService.getWeather("kyiv");
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
    _getDayWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // _weather?.cityName ?? "---",
          (_weatherList?.dayForecast[0]['main']['temp']).toString() ?? "---",
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Center(
                  child: Column(
                children: [
                  const Text(
                    "Mostly Sunny",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 172,
                    height: 139,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/cloudy.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    '${_weather?.temp.round()}',
                    style: TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Friday, 26 August 2022 | 10:00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 294,
                    padding: EdgeInsets.only(top: 13),
                    margin: EdgeInsets.only(top: 20),
                    height: 95,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(40, 239, 239, 239),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/recipitation.png',
                              width: 30,
                              height: 30,
                            ),
                            const Text('30% ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            const Text('Precipitation',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/humidity.png',
                              width: 30,
                              height: 30,
                            ),
                            Text('${_weather?.humidity.round()} %',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Text('Humidity',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/wind.png',
                              width: 30,
                              height: 30,
                            ),
                            Text('${_weather?.wind_speed} km/h',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Text('Wind Speed',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        )
                        // Text(
                        //   "30% Precipitation",
                        //   style: TextStyle(fontSize: 15),
                        // ),
                      ],
                    ),
                  )
                ],
              )),
              Container(
                child: Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home_filled),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 63,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Citysearch(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 63,
                      ),
                      IconButton(
                        icon: Icon(Icons.account_circle),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 63,
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )),
              )
            ]),
          )),
    );
  }
}
