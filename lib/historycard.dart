import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final name;
  final bmi;
  final category;
  final plan;
  final timestamp;

  HistoryCard(
      {required this.name,
        required this.bmi,
        required this.category,
        required this.plan,
        required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: Text(
              timestamp.toDate().toString(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(name[0]),
                radius: 30.0,
                backgroundColor: Colors.pink[100],
                foregroundColor: Colors.black,
              ),
              title: Text(
                  "BMI: " + category + " (" + bmi.toStringAsFixed(1) + ")"),
              subtitle: Text(
                plan.substring(2, 20) + "...",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ],
      ),
    );
  }
}