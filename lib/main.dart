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
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Text("WEIGHT"),
                        Text("50"),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.plus),
                              color: Colors.grey,
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.minus),
                              color: Colors.grey,
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Text("HEIGHT"),
                        Text("150"),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.plus),
                              color: Colors.grey,
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.minus),
                              color: Colors.grey,
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Text("Your BMI is"),
                    Text("19.5"),
                    Text("Normal"),
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
