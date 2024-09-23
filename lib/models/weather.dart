import 'dart:convert';

class Weather {
  final String cityName;
  final double temp;
  final String conditions;
  final double humidity;
  final double wind_speed;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.conditions,
      required this.humidity,
      required this.wind_speed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      conditions: json['weather'][0]['main'],
      humidity: json['main']["humidity"].toDouble(),
      wind_speed: json['wind']["speed"],
    );
  }
}
