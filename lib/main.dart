import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weightwatcher/bmibrain.dart';
import 'package:weightwatcher/input.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BMIBrain())
      ],
      child: MaterialApp(
        title: "BMI Calculator",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: InputScreen(),
      ),
    );
  }
}


