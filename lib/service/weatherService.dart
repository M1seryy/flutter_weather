import 'dart:convert';

import 'package:weather_app/models/dayWeather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class Weatherservice {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  Weatherservice();

  Future<Weather> getWeather(String cityName) async {
    cityName ??= "kyiv";

    final responce = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?appid=35eb3d4fe816cd13a92a10c20fb6258b&q=$cityName&units=metric'));

    if (responce.statusCode == 200) {
      // print(responce.body);
      return Weather.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception("Faild to load weather data");
    }
  }

  Future<Dayweather> getWeatherByDays(String cityName) async {
    cityName ??= "kyiv";

    final responce = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=35eb3d4fe816cd13a92a10c20fb6258b'));
    if (responce.statusCode == 200) {
      return Dayweather.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception("Faild to load weather data");
    }
  }
}
