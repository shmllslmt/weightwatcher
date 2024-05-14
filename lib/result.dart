import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weightwatcher/bmibrain.dart';

class ResultScreen extends StatelessWidget {
  // final String bmiValue;
  // final String bmiCategory;
  // final String name;
  //
  // ResultScreen({required this.bmiValue, required this.bmiCategory, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.pink[800],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi " + context.watch<BMIBrain>().nama,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Your BMI is",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    context.read<BMIBrain>().displayBMI(),
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    context.read<BMIBrain>().displayCategory(),
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("RE-CALCULATE"),
            color: Colors.pink[700],
            height: 100.0,
          ),
        ],
      ),
    );
  }
}

