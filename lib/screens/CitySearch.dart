import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/widgets/cityWidget.dart';

class Citysearch extends StatelessWidget {
  const Citysearch({super.key});

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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(183, 149, 125, 205),
                        Color.fromARGB(183, 82, 61, 127),
                      ],
                    ),
                    // color: Color.fromARGB(210, 138, 91, 240),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  // controller: _todoController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.location_on_rounded),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Add a new todo item",
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return const CityWidget();
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
