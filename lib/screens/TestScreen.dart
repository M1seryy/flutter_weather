import 'package:flutter/material.dart';

class ListOutPut extends StatelessWidget {
  ListOutPut({super.key});

  @override
  Widget build(BuildContext context) {
    List<TwoWords> TextFields = [
      TwoWords(text1: "1", text2: "2"),
      TwoWords(text1: "3", text2: "4"),
      TwoWords(text1: '5', text2: '6'),
      TwoWords(text1: '7', text2: '8'),
    ];

    final textFieldArr = TextFields.map((element) =>
        TextWidgetFunc(text: element.text1, text2: element.text2)).toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text("List Setting"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: textFieldArr,
          ),
        ));
  }
}

class TwoWords {
  final String text1;
  final String text2;

  TwoWords({required this.text1, required this.text2});
}

class TextWidgetFunc extends StatelessWidget {
  final String text;
  final String text2;
  const TextWidgetFunc({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(text), Spacer(), Text(text2)],
    );
  }
}
