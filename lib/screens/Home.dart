import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather app",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 38, 86, 141),
      ),
      backgroundColor: HexColor("#352163FF"),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: null,
          )),
    );
  }
}
