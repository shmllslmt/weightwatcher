import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final String header;
  final String content;
  final void Function() onPlusPress;
  final void Function() onMinusPress;

  ReusableCard({required this.header, required this.content, required this.onPlusPress, required this.onMinusPress});

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
                onPressed: onPlusPress,
                child: Icon(CupertinoIcons.plus),
                color: Colors.grey,
                shape: CircleBorder(),
                height: 50.0,
              ),
              MaterialButton(
                onPressed: onMinusPress,
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