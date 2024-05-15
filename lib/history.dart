import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  static String id = "HistoryScreen";

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View History"),
        centerTitle: true,
        backgroundColor: Colors.pink[700],
      ),
      body: null
    );
  }
}
