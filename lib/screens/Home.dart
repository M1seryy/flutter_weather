import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> weatherData = [];
  String city = "";
  Future<Map<String, dynamic>> fetchData() async {
    final responce = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?appid=35eb3d4fe816cd13a92a10c20fb6258b&q=Kyiv'));

    if (responce.statusCode == 200) {
      final data = jsonDecode(responce.body);
      print(data.coord);
      setState(() {
        // weatherData = data;
        // city = data.main.name;
      });
      return data;
    } else {
      throw Exception("!23");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          city,
          style: TextStyle(fontSize: 30, color: Colors.white),
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
                  const Text(
                    "23",
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
                  IconButton(
                      onPressed: () {
                        fetchData();
                      },
                      icon: Icon(Icons.check_circle))
                ],
              ))
            ]),
          )),
    );
  }
}
