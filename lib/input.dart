import 'package:flutter/material.dart';
import 'reusablecard.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int height = 150;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    content: weight.toString(),
                    onPlusPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    header: "HEIGHT",
                    content: height.toString(),
                    onPlusPress: () {
                      setState(() {
                        height++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        height--;
                      });
                    },
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
    );
  }
}
