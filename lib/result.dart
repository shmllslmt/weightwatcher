import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weightwatcher/bmibrain.dart';

class ResultScreen extends StatelessWidget {
  static String id = "ResultScreen";
  
  final _firestore = FirebaseFirestore.instance;

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
                  !context.watch<BMIBrain>().loading
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(20.0),
                              child: Text(context.watch<BMIBrain>().dietplan),
                            ),
                          ),
                        )
                      : SpinKitRotatingCircle(
                          color: Colors.grey,
                          size: 25.0,
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
            height: 75.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          MaterialButton(
            onPressed: () {
              final successful = _firestore.collection("weightwatcher").add({
                'name': context.read<BMIBrain>().nama,
                'bmi': context.read<BMIBrain>().calcBMI(),
                'category': context.read<BMIBrain>().displayCategory(),
                'plan': context.read<BMIBrain>().dietplan,
                'timestamp': FieldValue.serverTimestamp(),
              });

              if(successful != null) {
                print("Save successful");
              }
            },
            child: Text("SAVE"),
            color: Colors.pink[100],
            height: 75.0,
          ),
        ],
      ),
    );
  }
}
