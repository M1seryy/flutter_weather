import 'package:weather_app/models/weather.dart';

class Dayweather {
  final double message;
  final List dayForecast;

  Dayweather({required this.message, required this.dayForecast});

  factory Dayweather.fromJson(Map<String, dynamic> json) {
    return Dayweather(
        message: json['message'].toDouble(),
        dayForecast: json['list']);
  }
}
