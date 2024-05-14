import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: Colors.pink[800],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      header: "WEIGHT",
                      content: "50",
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      header: "HEIGHT",
                      content: "150",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your BMI is",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "19.5",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Normal",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("CALCULATE"),
              color: Colors.pink[700],
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final String header;
  final String content;

  ReusableCard({required this.header, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            header,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Icon(CupertinoIcons.plus),
                color: Colors.grey,
                shape: CircleBorder(),
                height: 50.0,
              ),
              MaterialButton(
                onPressed: () {},
                child: Icon(CupertinoIcons.minus),
                color: Colors.grey,
                shape: CircleBorder(),
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
