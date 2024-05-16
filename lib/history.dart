import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weightwatcher/historycard.dart';

class HistoryScreen extends StatefulWidget {
  static String id = "HistoryScreen";

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _firestore = FirebaseFirestore.instance;
  late final histories;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View History"),
          centerTitle: true,
          backgroundColor: Colors.pink[700],
        ),
        body: !loading
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, idx) {
                  List<HistoryCard> historyList = [];

                  if (histories != null) {
                    for (var history in histories.docs) {
                      final name = history['name'];
                      final bmi = history['bmi'];
                      final category = history['category'];
                      final plan = history['plan'];
                      final timestamp = history['timestamp'];

                      final historyItem = HistoryCard(
                          name: name,
                          bmi: bmi,
                          category: category,
                          plan: plan,
                          timestamp: timestamp);

                      historyList.add(historyItem);
                    }
                  }
                  return Column(
                    children: historyList,
                  );
                })
            : SpinKitRotatingCircle(
                color: Colors.grey,
                size: 25.0,
              ));
  }

  Future getHistory() async {
    setState(() => loading = true);

    histories = await _firestore
        .collection("weightwatcher")
        .orderBy('timestamp', descending: true)
        .get();

    if (histories != null) {
      setState(() => loading = false);
    }
  }
}
