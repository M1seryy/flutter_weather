import 'package:flutter/material.dart';
import 'package:weather_app/screens/CitySearch.dart';
import 'package:weather_app/screens/Home.dart';
import 'package:weather_app/screens/TestScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: ListOutPut(),
    );
  }
}
