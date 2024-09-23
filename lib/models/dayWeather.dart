import 'package:weather_app/models/weather.dart';

class Dayweather {
  final List<Weather> dayForecast;

  Dayweather({required this.dayForecast});

  factory Dayweather.fromJson(Map<String, dynamic> json) {
    return Dayweather(dayForecast: []);
  }
}
